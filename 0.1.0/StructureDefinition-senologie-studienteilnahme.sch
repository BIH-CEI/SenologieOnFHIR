<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile ResearchSubject
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:ResearchSubject</sch:title>
    <sch:rule context="f:ResearchSubject">
      <sch:assert test="count(f:extension[@url = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-screeningstatus']) &lt;= 1">extension with URL = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-screeningstatus': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienscreening']) &lt;= 1">extension with URL = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienscreening': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienname-code']) &lt;= 1">extension with URL = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienname-code': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienkontakt']) &lt;= 1">extension with URL = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-studienkontakt': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-aufklaerungsdatum']) &lt;= 1">extension with URL = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-aufklaerungsdatum': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
