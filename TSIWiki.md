## Title ##
### rent-a-house.com ###

## Abstract ##
> The objective of this project is to create a portal based in XML Technologies. The main purpose of the portal is to help students and academics (teachers, educating staff, PhD students, internships, traineeships, etc)to search for a house to rent. At the end, it will be possible to find and submit houses to rent. Using XML with a database-driven dynamic website we hope to make it possible to cleanly separate the site's content, style and programming logic.

## Description ##
  * Multi-Language Site
  * XML on the Server, the web server stores the XML documents for all the web pages and transforms them into HTML on the fly
  * The website will have a master document that provides share content and a site directory. The master document represents a new document type, with its a root element type different from that of a page document, and most other element types usable only in the master document.
  * We will use one XML Schema to validate both the master documents and page documents
  * The schema will be broken into three parts. One tests the master documents, another tests page documents and the last one tests constructs that occur in both document types(links,images and text markup)
  * The website will be composed by two sources. The two sources will be combined by the dynamic website engine to produce the final browser-viewable webpages. The first source is the dynamic content, usually stored in the eXist Database. The second source is static(although it will be stored in the eXist database).This source will supply the XML templates into which the dynamic values are inserted. These change only if the site designer decides to change them.
  * Website Backoffice Management
  * Users Profile Management in the Backoffice
  * Website dynamic layout management using XSLT transformations and XML template fragments.
  * Using predefined XML documents we will allow to create another XML documents using XSLT with XML-Schema validation, for example, we will have the house concept. Almost every house is different from other houses, so, to construct one house document we will need to combine different XML fragment documents like kitchens, living rooms, bathrooms, etc and then, voia lá... we have a unique house!
  * The dynamic part of the website it's supported by XQuery queries in the eXist database.
  * User Registration
  * Different type of users: Renters and HouseOwners.
  * Users can construct their own houses or select pre-defined houses(T1, T2, etc)
  * HouseOwners can Manage their Houses Profile.
  * HouseOwners can have more than one houses to Rent
  * HouseOwners can submit photos of the houses and their coordinates.
  * Renters can specify their wishes, sit back and receive matches.
  * Renters can search houses by number of rooms, city area, City, price, etc.
  * Renters can view the house location in the google maps.
  * Renters can comment and rating houses.
  * Houses will have ratings by users and by site administrators.
  * The main page will have one area for the "Latest Houses".
  * The generated HTML documents will be tunned with static CSS and JavaScript documents.
  * The website will be supported by Apache Tomcat Servlet Engine

## Tasks ##
  1. Lecture of all the references
  1. Definition of all the requirements
  1. Definition of the XML Schema
  1. Definition of all the vocabularies
  1. Construction of the website master document
  1. Definition of transformation types that will be used
  1. Layout definiton
  1. Creation of XSLT to process transformations
  1. Development of the Portal
  1. Development of the backoffice.
  1. Integration of Google Maps in the website.
  1. Elaboration of the report

## Goals ##

  * XML Technologies based site.
  * Design XML Schemas to interpret the XML vocabulary
  * Design XSLT to process the documents
  * Use of XQuery to query the eXist database
  * Integrate JSP with XML technologies
  * Integrate WebServices such as Google API's

## References ##
  * XML in a Nutshell, Third Edition
  * XSLT 2.0 Web Development

## Software ##
  * Eclipse SDK
  * oXygen XML plugin for Eclipse
  * eXist - Open Source native XML database
  * Apache Tomcat Servlet Engine
  * Java 2 SE 5.0

