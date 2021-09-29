<?php
function checkLogin($username, $password)
{
    global $conn;
    require_once("obj/user.class.php");
    $checkUserSQL = "SELECT * FROM users WHERE email='" . $username . "';";
    $result = $conn->query($checkUserSQL);
    $user = $result->fetch_assoc();
    if (hash("sha256", $username . $password) == $user["passwordhash"]) {
        return $user["id"];
    } else {
        return false;
    }
}

function getUserData($userid)
{
    global $conn;
    require_once("obj/user.class.php");
    $checkUserSQL = "SELECT * FROM users WHERE id='" . $userid . "';";
    $result = $conn->query($checkUserSQL);
    $user = $result->fetch_assoc();
    if (mysqli_num_rows($result) == 0) {
        return false;
    }
    return new User($user['id'], $user['username'], $user["email"], $user["email_confirmed"], $user['profilepicture'], $user['admin'], $user['passwordhash']);
}

function getNotes($userid)
{
    require_once("obj/note.class.php");
    global $conn;

    $userid = $conn->real_escape_string($userid);
    $query = "SELECT notes.id, notes.value, notes.examName, notes.FK_subject, notes.FK_user, subjects.FK_school, notes.FK_semester, subjects.additionalTag, schools.schoolName, semesters.semesterTag, subjects.subjectName FROM notes JOIN subjects ON notes.FK_subject = subjects.id JOIN schools ON subjects.FK_school = schools.id LEFT JOIN semesters ON notes.FK_semester = semesters.id WHERE FK_user=" . $userid . ";";
    $result = $conn->query($query);
    $notes = array();
    while ($row = $result->fetch_assoc()) {
        array_push($notes, new Note($row['id'], $row['value'], $row['examName'], $row['FK_subject'], $row['FK_user'], $row['FK_school'], $row['FK_semester'], $row['additionalTag'], $row['schoolName'], $row['semesterTag'], $row['subjectName']));
    }

    return $notes;
}
function getSemesters()
{
    require_once("obj/semester.class.php");
    global $conn;

    $query = "SELECT * FROM semesters;";
    $result = $conn->query($query);
    $semesters = array();
    while ($row = $result->fetch_assoc()) {
        array_push($semesters, new Semester($row["id"], $row["semesterTag"]));
    }

    return $semesters;
}
function getSchools()
{
    require_once("obj/school.class.php");
    global $conn;

    $query = "SELECT * FROM schools;";
    $result = $conn->query($query);
    $schools = array();
    while ($row = $result->fetch_assoc()) {
        array_push($schools, new School($row["id"], $row["schoolName"]));
    }

    return $schools;
}
function getSubjects()
{
    require_once("obj/subject.class.php");
    global $conn;
    $query = "SELECT s1.id, s1.FK_school, s1.additionalTag, schools.schoolName, s1.subjectName, s2.subjectName as 'overSubjectName' FROM subjects s1 JOIN schools ON s1.FK_school = schools.id LEFT JOIN subjects s2 ON s1.FK_overSubject = s2.id;";
    $result = $conn->query($query);
    $subjects = array();
    while ($row = $result->fetch_assoc()) {
        array_push($subjects, new Subject($row["id"], $row["FK_school"], $row["additionalTag"], $row["schoolName"], $row["subjectName"], $row["overSubjectName"]));
    }
    return $subjects;
}
function getAdditionalTags()
{
    global $conn;
    $query = "SELECT DISTINCT additionalTag FROM subjects";
    $result = $conn->query($query);
    $additionalTags = array();
    while ($row = $result->fetch_assoc()) {
        array_push($additionalTags, $row["additionalTag"]);
    }
    return $additionalTags;
}
function getSubjectsFromID($searchid)
{
    $subjects = getSubjects();
    foreach ($subjects as $subject) {
        if ($subject->id == $searchid) {
            return $subject;
        }
    }
    return false;
}
function getSubjectsFromName($searchname)
{
    $subjects = getSubjects();
    foreach ($subjects as $subject) {
        if ($subject->subjectName == $searchname) {
            return $subject;
        }
    }
    return false;
}

function GetShareLink($userid)
{
    global $conn;

    $token = random_int(100000, 999999);
    $link = hash("sha256", $userid . uniqid("", true));

    $sql = "INSERT INTO session_links (FK_user, link, token) VALUES ($userid, '$link', $token); ";
    $conn->query($sql);

    $returnvalue = new stdClass();
    $returnvalue->link = $link;
    $returnvalue->token = $token;

    return $returnvalue;
}

function getStickyNotes($userid)
{
    require_once("obj/stickynotes.class.php");
    global $conn;
    $sql = "SELECT stickynotes.PK_stickynote, DATE_FORMAT(stickynotes.createtime, '%d.%m.%Y - %H:%i') AS createtime, stickynotes.title FROM stickynotes WHERE FK_user=" . $userid . ";";
    $qry = $conn->query($sql);
    $stickynotes = array();
    while ($row = $qry->fetch_assoc()) {
        array_push($stickynotes, new StickyNotes($row["PK_stickynote"], $row["createtime"], $row["title"]));
    }
    return $stickynotes;
}

function getStickyNotesVal($PK_stickyNote)
{
    global $conn;
    $sql = "SELECT stickynotes.PK_stickynote, stickynotes.value FROM stickynotes WHERE PK_stickynote = $PK_stickyNote;";
    $qry = $conn->query($sql);
    $result = $qry->fetch_assoc();
    $stickynoteval = new stdClass();
    $stickynoteval->PK_stickynote = $result["PK_stickynote"];
    $stickynoteval->value = $result["value"];
    return $stickynoteval;
}

function saveStickyNote($stickynoteid, $newvalue)
{
    global $conn;

    $newvalue = $conn->real_escape_string($newvalue);
    $query = "UPDATE stickynotes SET value='" . $newvalue . "' WHERE PK_stickynote=" . $stickynoteid . ";";
    return $conn->query($query);
}

function createStickyNote($title, $value = "", $userid)
{
    global $conn;

    $title = $conn->real_escape_string($title);
    $value = $conn->real_escape_string($value);

    //Escape Notes attributes
    $query = "INSERT INTO stickynotes (title, value, FK_user) VALUES ('" . $title . "', '" . $value . "', $userid);";

    if (!$conn->query($query)) {
        return false;
    }
}

function ChangeStickyNoteTitle($stickynoteID, $newTitle)
{
    global $conn;

    $newTitle = $conn->real_escape_string($newTitle);
    $stickynoteID = $conn->real_escape_string($stickynoteID);

    $query = "UPDATE stickynotes SET title = '$newTitle' WHERE PK_stickynote = $stickynoteID";

    if (!$conn->query($query)) {
        return false;
    }
}

function deleteStickyNote($PK_stickynote)
{
    global $conn;

    //Escape Notes attributes
    $query = "DELETE FROM stickynotes WHERE PK_stickynote = '" . $PK_stickynote . "';";

    if (!$conn->query($query)) {
        return false;
    }
}

function uploadNote($note)
{
    global $conn;

    //Escape Notes attributes
    $query = "INSERT INTO notes (value, examName, FK_subject, FK_user, FK_semester) VALUES (" . $note->value . ", '" . $note->examName . "', " . $note->FK_subject . ", " . $note->FK_user . ", " . $note->FK_semester . ");";

    if (!$conn->query($query)) {
        return false;
    }
}


function setUsername($user, $newusername, $password)
{
    global $conn;

    if ($user->passwordhash == hash("sha256", $user->email . $password)) {
        $newusername = $conn->real_escape_string($newusername);
        $query = "UPDATE users SET username='" . $newusername . "' WHERE id=" . $user->id . ";";
        $conn->query($query);
    } else {
        return false;
    }
    return true;
}

function setEmail($user, $newemail, $password)
{
    global $conn;

    if ($user->passwordhash == hash("sha256", $user->email . $password)) {
        $updatedPsw = hash("sha256", $newemail . $password);

        $newemail = $conn->real_escape_string($newemail);
        $query = "UPDATE users SET email='" . $newemail . "', email_confirmed = 0, passwordhash='" . $updatedPsw . "' WHERE id=" . $user->id . ";";

        $conn->query($query);

        if (!sendConfirmEmail($newemail)) {
            return false;
        }
    } else {
        return false;
    }
    return true;
}

function sendConfirmEmail($receiver)
{
    return true;
    global $rootpath;
    $subject = 'Confirm Your Email';
    $message = file_get_contents("confirm_email_mailsite.html", true);
    $message = str_replace("%%useremail%%", $receiver, $message);
    $message = str_replace("%%urlpath%%", $rootpath . "assets/conf/", $message);

    $headers  = 'MIME-Version: 1.0' . "\r\n";
    $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
    $headers .= 'From: verify@helsananotes.ch' . "\r\n";
    //$headers .= 'Reply-To: gubler.florian@gmx.net' . "\r\n";
    $headers .=  'X-Mailer: PHP/' . phpversion();

    if (!mail($receiver, $subject, $message, $headers)) {
        return false;
    }
}

function setPassword($user, $oldpassword, $newpassword)
{
    global $conn;
    if ($user->passwordhash == hash("sha256", $user->email . $oldpassword)) {
        $updatedPsw = hash("sha256", $user->email . $newpassword);
        $query = "UPDATE users SET passwordhash='" . $updatedPsw . "' WHERE id=" . $user->id . ";";
        $conn->query($query);
    } else {
        return false;
    }
    return true;
}

function AdminTools_CreateSubject($subjectName, $FK_school, $addtionalTag, $overSubject)
{
    global $conn;
    if ($addtionalTag == "") {
        if ($overSubject == "") {
            $sql = "INSERT INTO subjects (subjectName, FK_school) VALUES ('$subjectName', $FK_school);";
        } else {
            $sql = "INSERT INTO subjects (subjectName, FK_school, FK_overSubject) VALUES ('$subjectName', $FK_school, $overSubject);";
        }
    } else {
        if ($overSubject == "") {
            $sql = "INSERT INTO subjects (subjectName, FK_school, additionalTag) VALUES ('$subjectName', $FK_school, '$addtionalTag');";
        } else {
            $sql = "INSERT INTO subjects (subjectName, FK_school, additionalTag, FK_overSubject) VALUES ('$subjectName', $FK_school, '$addtionalTag', $overSubject);";
        }
    }
    $conn->query($sql);
}

function AdminTools_CreateSemester($semesterTag)
{
    global $conn;
    $sql = "INSERT INTO semesters (semesterTag) VALUES ('$semesterTag');";
    $conn->query($sql);
}

function AdminTools_ChangeuserPrivileges($userID, $newPrivilege)
{
    global $conn;
    $sql = "UPDATE users SET admin=$newPrivilege WHERE id=$userID;";
    $conn->query($sql);
}

function AdminTools_GetUserList()
{
    global $conn;
    require_once("obj/user.class.php");
    $sql = "SELECT * FROM users";
    $qry = $conn->query($sql);
    $users = array();

    while ($user = $qry->fetch_assoc()) {
        array_push($users, new User($user['id'], $user['username'], $user["email"], $user["email_confirmed"], $user['profilepicture'], $user['admin'], $user['passwordhash']));
    }
    return $users;
}
function uploadPB($userid, $uploadpbfile, $uploadpbdata)
{
    global $conn;
    //generate Filename
    $target_dir = "../img/profilepictures/";
    $filecount = count(scandir($target_dir)) - 1;
    file_put_contents("../loging.txt", $filecount);
    $newfilename = "profilepicture_" . ($filecount) . "." . explode(".", $uploadpbfile["name"])[count(explode(".", $uploadpbfile["name"])) - 1];
    $target_file = $target_dir . $newfilename;
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    $counter = 0;
    while (file_exists($target_file)) {
        $counter++;
        $newfilename = "profilepicture_" . ($filecount + $counter) . "." . explode(".", $uploadpbfile["name"])[count(explode(".", $uploadpbfile["name"])) - 1];
        $target_file = $target_dir . $newfilename;
    }

    // Check if image file is a actual image or fake image
    $check = getimagesize($uploadpbfile["tmp_name"]);
    if ($check !== false) {
        $uploadOk = 1;
    } else {
        $uploadOk = 0;
    }

    // Allow certain file formats
    if (
        $imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
        && $imageFileType != "gif"
    ) {
        $uploadOk = 0;
    }

    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        return false;
    } else {
        if (move_uploaded_file($uploadpbfile["tmp_name"], $target_file)) {
            do {
                if (file_exists($target_file)) {
                    break;
                }
            } while (true);

            //Delete old File
            $oldimg = $conn->query("SELECT profilepicture FROM users WHERE id=" . $userid . ";")->fetch_assoc()["profilepicture"];
            if ($oldimg != "defaultpb.jpg" && file_exists($target_dir . $oldimg)) {
                unlink($target_dir . $oldimg);
            }

            //Set New File
            $conn->query("UPDATE users SET profilepicture='" . $newfilename . "' WHERE id=" . $userid . ";");

            //Crop Image
            $image_data = json_decode($uploadpbdata);
            $source = imagecreatefromjpeg($target_file);
            $im2 = imagecrop($source, ['x' => $image_data->x, 'y' => $image_data->y, 'width' => $image_data->width, 'height' => $image_data->height]);

            imagejpeg($im2, $target_file);
        } else {
            return false;
        }
    }
}
