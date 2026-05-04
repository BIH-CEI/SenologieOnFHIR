<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile ServiceRequest
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:ServiceRequest</sch:title>
    <sch:rule context="f:ServiceRequest">
      <sch:assert test="count(f:extension[@url = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-operations-duration']) &lt;= 1">extension with URL = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-operations-duration': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-tumor-conference-consent']) &lt;= 1">extension with URL = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-tumor-conference-consent': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-pre-op-markierung']) &lt;= 1">extension with URL = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-pre-op-markierung': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-pre-op-blutabnahme']) &lt;= 1">extension with URL = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-pre-op-blutabnahme': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-pre-op-antibiotikatherapie']) &lt;= 1">extension with URL = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-pre-op-antibiotikatherapie': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-operating-table-setup']) &lt;= 1">extension with URL = 'https://www.senologie.org/fhir/StructureDefinition/ex-senologie-operating-table-setup': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ServiceRequest/f:code</sch:title>
    <sch:rule context="f:ServiceRequest/f:code">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ServiceRequest/f:bodySite</sch:title>
    <sch:rule context="f:ServiceRequest/f:bodySite">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
