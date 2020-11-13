<?php


    // getting the xml document
    $xml_doc = new DOMDocument();
    $xml_doc->load("oscars.xml");

    // getting the stylesheet
    $xsl_doc = new DOMDocument();
    $xsl_doc->load("stylesheet.xsl");
    // setting up the $proc variable to an unnasigned xslt processor
    $proc = new XSLTProcessor();
    // creating variables

    // winners and losers
    $winner = $_POST["did_they_win"];
    $proc-> setParameter('', 'winner', $winner);

    // category
    $category = $_POST["category"];
    $proc-> setParameter('', 'category', $category);
    // nominee
    $nominee = $_POST["nominee"];
    $proc-> setParameter('', 'nominee', $nominee);
    // info
    $info = $_POST["info"];
    $proc-> setParameter('', 'info', $info);
    // year
    $year = $_POST["year"];
    $proc-> setParameter("", 'year', $year);


    $proc->importStylesheet($xsl_doc);
    //setting the $newdom variable to transform the xml to XSLT
    $newdom = $proc->transformToDoc($xml_doc);
    // making the table
    print $newdom->saveXML();



?>