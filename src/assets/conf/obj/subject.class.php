<?php
class Subject{
    public $id;
    public $FK_school;
    public $additionalTag;
    public $schoolName;
    public $subjectName;
    public $overSubject;

    function __construct($_id, $_FK_school, $_additionalTag, $_schoolName, $_subjectName, $_overSubject = null){
        $this->id = $_id;
        $this->FK_school = $_FK_school;
        $this->additionalTag = $_additionalTag;
        $this->schoolName = $_schoolName;
        $this->subjectName = $_subjectName;
        $this->overSubject = $_overSubject;
    }
}
