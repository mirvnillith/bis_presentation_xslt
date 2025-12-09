<?xml version="1.0" encoding="UTF-8"?>
<!--
******************************************************************************************************************

		title= Peppol BIS Despatch Advice, Despatch Transaction - Reference stylesheet
		Version of this reference stylesheet: 1.1
		publisher= SFTI
		conformsTo= UBL-DespatchAdvice-2.1.xsd 

		The assumption is that is that the stylesheet is applied to messages that are formally correct, i.e. 
		messages that comply with XML schema and schematron rules. However, as this reference stylesheet is 
		likely to be used also in test environments, some basic validation features have been included, 
		and any consequential errors are displayed as needed."
		
		Derived from work by SFTI tekniska kansli, Sweden
		
******************************************************************************************************************
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:n1="urn:oasis:names:specification:ubl:schema:xsd:DespatchAdvice-2" xmlns:cdl="http://docs.oasis-open.org/codelist/ns/genericode/1.0/" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:oasis:names:specification:ubl:schema:xsd:CoreComponentParameters-2" xmlns:sdt="urn:oasis:names:specification:ubl:schema:xsd:SpecializedDatatypes-2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" exclude-result-prefixes="n1 cdl cac cbc ccts sdt udt">
  <xsl:import href="CommonTemplates.xsl"/>
  <xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN" doctype-system="http://www.w3.org/TR/html4/loose.dtd" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="stylesheet_url" select="'NONE'"/>
  <xsl:template name="doc-head">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <xsl:choose>
      <xsl:when test="$stylesheet_url = 'NONE'">
        <style>* {
    box-sizing: border-box;
}

:root {
  --white: #ffffff;
  --grey: #f3f3f2;
  --Line-color: #979797;
  --font-color: #484848;
}

/* Text styles */

h1 {
  font-family: Helvetica;
  font-size: 3.3vw;
  font-weight: bold;
  font-style: normal;
  font-stretch: normal;
  line-height: 3.5vw;
  letter-spacing: normal;
  color: #484848;
}

h2 {
  font-family: Helvetica;
  font-size: 2.4vw;
  font-weight: bold;
  font-style: normal;
  font-stretch: normal;
  line-height: 2.5vw;
  letter-spacing: normal;
  color: #484848;
  margin:0px;
}

h3 {
  font-family: Helvetica;
  font-size: 1.9vw;
  font-weight: bold;
  font-style: normal;
  font-stretch: normal;
  line-height: 2vw;
  letter-spacing: normal;
  color: #484848;
  margin:0px;
}


h4 {
  font-family: Helvetica;
  font-size: 1.3vw;
  font-weight: bold;
  font-style: normal;
  font-stretch: normal;
  line-height: 1.5vw;
  letter-spacing: normal;
  color: #484848;
  margin:0px;
}

p,th,td {
  font-family: Helvetica;
  font-size: 1.2vw;
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  line-height: 1.5vw;
  letter-spacing: normal;
  color: #484848;
  margin-top:0.5vw;
  margin-bottom:0.5vw;
}


table
{
	
	/*border: 2px solid black;*/
	width: 100%;
	
}
table, th, td
{
border-collapse: collapse;
}
tr
{
	vertical-align: top;
}
tr:nth-child(even) {
    background-color: #f3f3f2;
}

td
{
	vertical-align: top;
	border-bottom:1px solid #979797;
	/*border:2px solid black;*/
}


th
{
	border-bottom: 2px solid #979797;
	font-weight:normal;
}


td.UBLLine
{
	color:#979797;
	margin: 0em;
}

hr
{
color:var(--Line-color);

}



.col-1 {width: 8.33%;}
.col-2 {width: 16.66%;}
.col-3 {width: 25%;}
.col-4 {width: 33.33%;}
.col-5 {width: 41.66%;}
.col-6 {width: 50%;}
.col-7 {width: 58.33%;}
.col-8 {width: 66.66%;}
.col-9 {width: 75%;}
.col-10 {width: 83.33%;}
.col-11 {width: 91.66%;}
.col-12 {width: 100%;}

[class*="col-"] {
    float: left;
    padding: 1px;
	margin-top:1px;
	border: solid 0px #979797;
}

.row::after {
    content: "";
    clear: both;
    display: table;
}
#bottomrow{

border-bottom:2px solid #979797;
}
#wrapper{
padding:1vw;
border: 1px solid #979797;
}
#footer
{
border-top: 2px solid #979797;
background-color: #f3f3f2;
padding:0px;
margin-top:1vw;
}
#header
{
padding: 0.5vw;
}
#headerrow
{
padding-top:1vw;
border-bottom:1px solid #979797;
}
#tablerow
{
padding-top:1vw;
}

</style>
      </xsl:when>
      <xsl:otherwise>
        <link rel="stylesheet" href="{$stylesheet_url}"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="n1:DespatchAdvice">
    <!-- Start HTML -->
    <html>
      <xsl:call-template name="doc-head"/>
      <head>
        <link rel="Stylesheet" type="text/css" href="PEPPOL.css"/>
        <meta name="viewport" content="width=device-width,initial-scale=1"/>
        <title>PEPPOL BIS 3 Despatch Advice</title>
      </head>
      <body>
        <div id="wrapper">
          <!-- Start on Despatch Type row-->
          <div class="row" id="bottomrow">
            <div class="col-6">

              <h2 style="margin-bottom:0px">
                <xsl:call-template name="DocumentHeader">
                  <xsl:with-param name="DocumentCode" select="local-name(.)"/>
                </xsl:call-template>
              </h2>
              <h3 style="margin-top:0px">
                <xsl:call-template name="DocumentCode">
                  <xsl:with-param name="DCode" select="cbc:ID"/>
                </xsl:call-template>
              </h3>
              <h1>
                    <xsl:value-of select="cac:DespatchSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
              </h1>
            </div>
            <div class="col-6" id="header">
              <div class="col-6">
                <p align="left">
                  <b>
                  <!-- Inserting Despatch Issue Date -->
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir16-004'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br/>
                  
                  <xsl:value-of select="cbc:IssueDate"/>
                  <br/>
                </p>
                <xsl:if test="cbc:IssueTime">
                  <p align="left">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir16-005'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                    <br/>
                    <xsl:apply-templates select="cbc:IssueTime"/>
                    <br/>
                  </p>
                </xsl:if>
               
                 <xsl:if test="cbc:Note">
                  <p align="left">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir16-088'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                    <br/>
                    <xsl:apply-templates select="cbc:Note"/>
                    <br/>
                  </p>
                </xsl:if>
              </div>
              <!--Start of Catalogue Header Information:-->
              <div class="col-6">
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir16-003'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <!-- Inserting Despatch ID -->
                  <br/>
                  <xsl:value-of select="cbc:ID"/>
                  <br/>
                </p>
                <p align="left">
                  <b>
                    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir19-005'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                    </xsl:call-template>
                  </b>
                  <br/>
                  <!-- Inserting Despatch Note  -->
                  <xsl:value-of select="cbc:Note"/>
                  <br/>
                </p>
                 <xsl:if test="cac:OrderReference/cbc:ID">
                  <p align="left">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir16-006'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                    <br/>
                    <xsl:apply-templates select="cac:OrderReference/cbc:ID"/>
                    <br/>
                  </p>
                </xsl:if>
              </div>
            </div>
            <!--End of Despatch Header Information-->
          </div>
          <div class="row" id="headerrow">
            <div class="col-6">  <!-- Inserting Despatch Supplier Party -->
             
              <p>
                <b>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'tir16-DespatchSupplierParty'"/>
                    <xsl:with-param name="Colon-Suffix" select="'false'"/>
                  </xsl:call-template>
                </b>
                <br/>
                <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir16-071'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:DespatchSupplierParty/cac:Party/cbc:EndpointID"/>
					      <xsl:if test="cac:DespatchSupplierParty/cac:Party/cbc:EndpointID/@schemeID">
						    [<xsl:value-of select="cac:DespatchSupplierParty/cac:Party/cbc:EndpointID/@schemeID"/>]
					      </xsl:if>
				        <br/>  
			          	<xsl:if test="cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID">
				       <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir16-p001'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
					    <xsl:if test="cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID">
						  [<xsl:value-of select="cac:DespatchSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID"/>]
						  <br/>
					  </xsl:if>
				    </xsl:if>
				    <xsl:if test="cac:DespatchSupplierParty/cac:Party/cac:PostalAddress">
				    <b>
				    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir16-postaladdress'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                </xsl:call-template>
                </b>
				    <br/>
					    <xsl:if test="cac:DespatchSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName">
					    <xsl:apply-templates select="cac:DespatchSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
				    	<br/>
				    	</xsl:if>
					  <xsl:if test="cac:DespatchSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName">
				  	<xsl:apply-templates select="cac:DespatchSupplierParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:DespatchSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName">
					<xsl:apply-templates select="cac:DespatchSupplierParty/cac:Party/cac:PostalAddress/cbc:CityName"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:DespatchSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone">
					<xsl:apply-templates select="cac:DespatchSupplierParty/cac:Party/cac:PostalAddress/cbc:PostalZone"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:DespatchSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity">
					<xsl:apply-templates select="cac:DespatchSupplierParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:DespatchSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressLine/cbc:Line">
					<xsl:apply-templates select="cac:DespatchSupplierParty/cac:Party/cac:PostalAddress/cbc:AddressLine/cbc:Line"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:DespatchSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
					<xsl:apply-templates select="cac:DespatchSupplierParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode"/>
					</xsl:if>
				</xsl:if>
              <br/>
              <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir16-007'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:DespatchSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
             
				<br/>
			<xsl:if test="cac:DespatchSupplierParty/cac:Party/cac:Contact">
				    <b>
				    <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir16-contact'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                </xsl:call-template>
                </b>
				    <br/>
					    <xsl:if test="cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Name">
					    <xsl:apply-templates select="cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Name"/>
				    	<br/>
				    	</xsl:if>
					  <xsl:if test="cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Telephone">
				  	<xsl:apply-templates select="cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:Telephone"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail">
					<xsl:apply-templates select="cac:DespatchSupplierParty/cac:Party/cac:Contact/cbc:ElectronicMail"/>
					<br/>
					</xsl:if>
				</xsl:if>
              </p>
            </div>  
			<div class="col-6"> <!-- Inserting Seller Supplier Party -->
              <p>
                <b>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'tir16-SellerParty'"/>
                    <xsl:with-param name="Colon-Suffix" select="'false'"/>
                  </xsl:call-template>
                </b>
                <br/>
                <xsl:apply-templates select="cac:SellerSupplierParty"/>
                <br/>
              </p>
            </div>   
          </div>
          <div class="row" id="headerrow">
            <div class="col-6">  <!-- Inserting Delivery Customer Party -->
             
              <p>
                <b>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'tir16-DeliveryCustomerParty'"/>
                    <xsl:with-param name="Colon-Suffix" select="'false'"/>
                  </xsl:call-template>
                </b>
                <br/>
                <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir16-016'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID"/>
					<xsl:if test="cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID/@schemeID">
						[<xsl:value-of select="cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID/@schemeID"/>]
					</xsl:if>
				<br/>  
				<xsl:if test="cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID">
				   <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir16-015'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID"/>
					<xsl:if test="cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID">
						[<xsl:value-of select="cac:DeliveryCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID"/>]
						<br/>
					</xsl:if>
				</xsl:if>
				<xsl:if test="cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress">
				<b>
				<xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir16-postaladdress'"/>
                      <xsl:with-param name="Colon-Suffix" select="'false'"/>
                </xsl:call-template>
                </b>
				<br/>
					<xsl:if test="cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName">
					<xsl:apply-templates select="cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:StreetName"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName">
					<xsl:apply-templates select="cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AdditionalStreetName"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName">
					<xsl:apply-templates select="cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CityName"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone">
					<xsl:apply-templates select="cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:PostalZone"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity">
					<xsl:apply-templates select="cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:CountrySubentity"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressLine/cbc:Line">
					<xsl:apply-templates select="cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cbc:AddressLine/cbc:Line"/>
					<br/>
					</xsl:if>
					<xsl:if test="cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode">
					<xsl:apply-templates select="cac:DeliveryCustomerParty/cac:Party/cac:PostalAddress/cac:Country/cbc:IdentificationCode"/>
					</xsl:if>
				</xsl:if>
              <br/>
              <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir16-014'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:DeliveryCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName"/>
               <br/>
              </p>
            </div>
            <div class="col-3">  <!--Inserting Buyer Customer Party-->
             
                    <p>
                <b>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'tir16-BuyerParty'"/>
                    <xsl:with-param name="Colon-Suffix" select="'false'"/>
                  </xsl:call-template>
                </b>
                <br/>
                <xsl:apply-templates select="cac:BuyerCustomerParty"/>
                <br/>
              </p>
            </div>
            <div class="col-3"> <!--Insert OriginatorCustomerParty-->
              <p>
                <b>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'tir16-OriginatorCustomerParty'"/>
                    <xsl:with-param name="Colon-Suffix" select="'false'"/>
                  </xsl:call-template>
                </b>
                <br/>
                <xsl:apply-templates select="cac:OriginatorCustomerParty"/>
                <br/>
              </p>
            </div>     
          </div>        
          <div class="row" id="headerrow">
            <div class="col-6"> <!-- Inserting Additional Document Reference -->
              
              <p>
                <b>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'tir16-AdditionalDocumentReference'"/>
                    <xsl:with-param name="Colon-Suffix" select="'false'"/>
                  </xsl:call-template>
                </b>
                <xsl:if test="cac:AdditionalDocumentReference">
					<br/>
					<xsl:apply-templates select="cac:AdditionalDocumentReference" mode="DespatchAdvice"/>
				</xsl:if>
            </p>
            </div>
            <div class="col-6"> <!-- Inserting Shipment -->
              
              <p>
                <b>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'tir16-Shipment'"/>
                    <xsl:with-param name="Colon-Suffix" select="'false'"/>
                  </xsl:call-template>
                </b>
                <br/>
                <xsl:if test="cac:Shipment">
					<br/>
					<xsl:apply-templates select="cac:Shipment" mode="DespatchAdviceHeader"/>
				</xsl:if> 
              </p>
            </div>
          </div>
         <!--Start DespatchLine-->
           <div class="col-12">
            <br/>
            <h3>
              <xsl:call-template name="LabelName">
                <xsl:with-param name="BT-ID" select="'tir16-DespatchLines'"/>
                <xsl:with-param name="Colon-Suffix" select="'false'"/>
              </xsl:call-template>
            </h3>
          </div>
          <div class="row" id="tablerow">
            <div class="col-12">
              <table>
                <tr class="UBLOrderLineHeader">
                  <th align="left" valign="top" width="5%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir16-046'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th align="left" valign="top" width="10%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir16-OrderlineReference'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th align="left" valign="top" width="35%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'Order_Item'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th valign="top" align="left" width="10%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'BT-129'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                  <th align="left" valign="top" width="10%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir16-047'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                      <br/>
                    </b>
                  </th>
                  <th align="left" valign="top" width="30%">
                    <b>
                      <xsl:call-template name="LabelName">
                        <xsl:with-param name="BT-ID" select="'tir16-Shipment'"/>
                        <xsl:with-param name="Colon-Suffix" select="'false'"/>
                      </xsl:call-template>
                    </b>
                  </th>
                </tr>
               <xsl:apply-templates select="cac:DespatchLine" mode="despatch"/>
              </table>
            </div>
          </div>
          <!--End Despatchline-->
    
          <!-- Start on technical stylesheet footer - for all transactions -->
          <div class="row" id="tablerow">
            <div class="col-12">
              <p>
                <small>
                  <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir16-071'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:DespatchSupplierParty/cac:Party/cbc:EndpointID"/>
					      <xsl:if test="cac:DespatchSupplierParty/cac:Party/cbc:EndpointID/@schemeID">
						    [<xsl:value-of select="cac:DespatchSupplierParty/cac:Party/cbc:EndpointID/@schemeID"/>]
					      </xsl:if>
                  <br/>
                 <xsl:call-template name="LabelName">
                      <xsl:with-param name="BT-ID" select="'tir16-016'"/>
                      <xsl:with-param name="Colon-Suffix" select="'true'"/>
                </xsl:call-template>
                <xsl:apply-templates select="cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID"/>
					<xsl:if test="cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID/@schemeID">
						[<xsl:value-of select="cac:DeliveryCustomerParty/cac:Party/cbc:EndpointID/@schemeID"/>]
					</xsl:if>
                  <br/> 
                  <xsl:value-of select="cbc:UBLVersionID"/>
                  <br/>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'BT-23'"/>
                    <xsl:with-param name="Colon-Suffix" select="'true'"/>
                  </xsl:call-template>
                  <xsl:value-of select="cbc:ProfileID"/>
                  <br/>
                  <xsl:call-template name="LabelName">
                    <xsl:with-param name="BT-ID" select="'BT-24'"/>
                    <xsl:with-param name="Colon-Suffix" select="'true'"/>
                  </xsl:call-template>
                  <xsl:value-of select="cbc:CustomizationID"/>
                  <xsl:if test="cbc:UUID">
                    <xsl:value-of select="cbc:UUID"/>
                    <br/>
                  </xsl:if>
                  <br/>
                  <br/>This Despatch visualization is generated from SFTI BIS Despatch Advice 3 XSL Stylesheet Version 1.1<br/>
                </small>
              </p>
            </div>
          </div>
          <!-- End of technical stylesheet footer-->
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
