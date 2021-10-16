<?php

function uploadFileHandle($currFile = null, $prefix = "", $destDir = null) {
    if ($currFile == null) {
        return false;
    } else if ($currFile["error"] > 0) {
        return false;
    } else {
        $allowedExts = ["doc", "pdf"];
        $filenameStrArr = explode(".", $currFile["name"]);
        $extension = strtolower(end($filenameStrArr));

        $allowedTypes = ["image/gif", "image/jpeg", "image/png", "image/pjpeg"];
        $fileType = $currFile["type"];

        $sizeLimit = 200; 
        $fileSize = $currFile["size"] / 1024; 

        if (in_array($extension, $allowedExts) 
            && in_array($fileType, $allowedTypes) 
            && ($fileSize <= $sizeLimit)) {

            $destDir = ($destDir == null) ? "upload" : $destDir;
            $destFilename = "pic_" . $prefix . "_" .time() . ".{$extension}";
            $destFinal = $destDir . "/" . $destFilename;

            if (move_uploaded_file($currFile["tmp_name"], $destFinal)) {
                return $destFilename;
            } else {
                return false;
            }
        } else { // do no handle the upload, invalid file
            return false;
        }
    }
}
?>