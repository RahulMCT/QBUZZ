/*
-- -------------------------------------------------------------------------------
--
-- Copyright © 2022 by Spectades BV
--
-- Filename    : QBUZZ_external_wsjobo.txt
--
-- Description : Extensible Framework JavaScript WSJOBO - New Tab on WSJOBO
-
-- Product     : EAM             Release : 12.0
--
-- Author      :MCT
--
-- CHANGE HISTORY
--
-- 0001 21-09-2022 - MCT - WSJOBO - New Tab on WSJOBO
-- 0002 03-10-2022 - MCT - Issues Fixed
-- 0003 04-10-2022 - MCT - Work Order Control
-- 0004 31-10-2022 - SPC-288 When monthly invoicing is not checked, an extra 'control popup' is necessary in both the languages.
-- 0005 01-11-2022 - SPC-290 protect the "Add new Part" block when "Part Not Exist" checkbox is unchecked, and vice-versa.
-- 0006 24-11-2022 - SPC-295 Added Supplier description virtual field on Record view tab.
-- 0007 03-04-2023 - SPC-325 When supplier is '50406' then udfchar40 is not required else protected.
-- 0008 12-04-2023 - SPC-327 VLOOT-MAN usergroup is not allowed to make changes to all the tabs but Supplier Can.
-- 0009 15-05-2023 - SPC-340 Location field hidden for every status.
-- 0010	19-05-2023 - SPC-342 Copy record on "work order supplier" -> incident no and other fields should be clear.
-- 0011 19-05-2023 - SPC-343 udfchar40 field clear and protected for every supplier except supplier '50406'.
-- 0012 02-06-2023 - Activity Label changed and currency field disabled.
-- 0013 06-06-2023 - Locale handled when getting max line number
-- 0014 22-08-2023 - SPC-416 reverted back (SPC-343 udfchar40 field clear and protected for every supplier except supplier '50406')
-- 0015 23-08-2023 - reveted back previous changes
-- 0016 13-03-2024 - SPC-485 Security for N-Parts in new tab on WSJOBO.
-- 0017 15-03-2024 - SPC-488 Bug fixed: virtual dropdown field in U1 Tab.
-- 0018 15-03-2024 - SPC-488 Bug fixed: All fields are protected with status 'C' in the U1 Tab.
-- 0019 16-05-2024 - SPC-485 Error raised only when catalog ref no is updated.
-- 0020 21-05-2024 - SPC-485 Bug fixed only when record and tab changes.
-- 0021 06-06-2024 - SPC-523 Enable the Price field for manual entry and make it mandatory (value must be greater than 0).
-- 0022 28-10-2024 - SPC-630 Check Apply for 'wspf_10_ou_pricep' (value must be greater than 0).
-- 0023 24-01-2024 - SPC-630 Build a check for verify the Price Per H ('wspf_10_ou_partprice') value must be greater than 0.
-- 0024 30-01-2024 - SPC-630 Error Message update base on user language.
-- 0025 03-06-2024 - SPC-698 Set layout for Part and Part Description, and populate Part Description.
-- 0026 15-10-2025 - SPC-768 Note field mandatory based on status(TCS/TC).
-- -------------------------------------------------------------------------------
 */

var headerData = null;
var userFunction = 'WSJOBO';
var userFunctionTab = 'U1';
var webservicePromptCode = 'WSJOBO';
var DEBUG = false;
var vLoc1DescFld = "";
var vcurrentRecord = "";
var myDropDown = "";
var vUser = "";
var vLang = "";
var vCopyClicked = false;
var vCheck = "";
var vPartDescFld = "";
var vQtyDescFld = "";
var vAsstDescFld = "";
var vReqDemob = "";
var vTspMode = "";
var vByAsset = "";
var vSerialNo = "";
var vRecHeightUOM = "";
var vRecWidthUOM = "";
var vErrorFlag = false;
var canAddSubpackages = false;
var vHeaderText = "";
var dummyContainerRefField = null;
var vBaseTitle = "";
var vSubPckCode = "";
var theRealField = "";
var vpkgHasSubpackages = "";
var resetClicked = false;
var vparentPackFlag = false;
var vNPartSuccess;
var vpkgHasNonTRParts = "";
var vWidthUOM = "";
var vHeightUOM = "";
var vWeightUOM = "";
var vRecGrossWtUOM = "";
var vRecNetWtUOM = "";
var gListFieldName = "";
var gStatusCode = ""; //Global variable to store status code and description
var gStatusAuth = ""; //Global variable to store status authorization
var gStatusValue = "";
var MODE_LISTVIEW = "LISTVIEW";
var MODE_RECORDVIEW = "RECORDVIEW";
var gGlobalClass = "";
var gContainerWarning = "";
var gContainerRefHyperlinkFlag = "FALSE";
var vworkorderstatus = "";
var start = "start";
var vCatalogueReferenceOld = '';
var dropDownStore = '';
var vFieldContainerPart = '';

Ext.define('EAM.custom.external_wsjobo', {
    extend: 'EAM.custom.AbstractExtensibleFramework',
    getSelectors: function () {
        thisContext = this;
        return {

            '[extensibleFramework] [tabName=HDR] uxcombobox[name=workorderstatus]': {
                select: function (a, b) {
                    try {

                        EAM.Utils.debugMessage("status change function called !");
                        var formPanel = this.getFormPanel();
                        var headerStatus = formPanel.getFldValue("workorderstatus");
                        EAM.Utils.debugMessage(" headerStatus afterrender function called !" + gStatusValue);
                        var vPageData = formPanel.responseData.pageData;
                        vUser = EAM.AppData.getUser();
                        vLang = EAM.AppData.getLanguage();
                        var userGroup = getUserGroup();
                        /*To generate a popup for type Damage or Monthly Invoice checked*/
                        var vworkOrder = formPanel.getFldValue("workordertype");
                        EAM.Utils.debugMessage("workordertype afterrender function called " + vworkOrder);
                        EAM.Utils.debugMessage("old status value is " + vworkorderstatus);

                        if (vworkorderstatus === 'TCS') {
                            /*if (vworkOrder === 'SCH' && headerStatus === 'AG') {
                            //var vReturnVar = true;
                            showPopup();
                            //return vReturnVar;
                            } else*/
                            if (/*vworkOrder != 'SCH' &&*/ headerStatus === 'AG') {
                                var vSupplier = formPanel.getFldValue("udfchar19");
                                var requestData = {
                                    GRID_NAME: "NUSUPP",
                                    GRID_TYPE: "LOV",
                                    REQUEST_TYPE: "LOV.HEAD_DATA.STORED",
                                    LOV_ALIAS_NAME_1: "parameter.comcode",
                                    LOV_ALIAS_VALUE_1: vSupplier,
                                    LOV_ALIAS_TYPE_1: "text",
                                    LOV_ALIAS_NAME_2: "parameter.comorg",
                                    LOV_ALIAS_VALUE_2: "*",
                                    LOV_ALIAS_TYPE_2: "text",

                                    CURRENT_TAB_NAME: "HDR",
                                    USER_FUNCTION_NAME: "WSJOBO",
                                    SYSTEM_FUNCTION_NAME: "WSJOBO",
                                    COMPONENT_INFO_TYPE: "DATA_ONLY"
                                };

                                var response = EAM.Ajax.request({
                                    url: "LOVPOP",
                                    params: requestData
                                });

                                var vrecords = response.responseData.pageData.grid.GRIDRESULT.GRID.DATA[0].commonchk;

                                EAM.Utils.debugMessage("vrecords is " + vrecords);

                                if (vrecords === 'N') {
                                    showPopup();
                                }

                            }
                        }

                        if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                            protectAllFields('HDR', formPanel);
                            return;
                        } else {
                            protectHdrField(formPanel, "");
                        }

                        if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                            headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                            protectAllFields('HDR', formPanel);
                            return;

                        } else {
                            protectHdrField(formPanel, "");
                        }
                        fieldStateSetNoteFld(formPanel);
                        //EAM.Utils.debugMessage(" headerStatus afterrender function called " + headerStatus);


                    } catch (e) {
                        EAM.Utils.debugMessage('Error in After Render : ' + e);
                    }
                }
            },

            '[extensibleFramework] [tabName=HDR]': {
                afterrender: function (a, b) {
                    try {
                        if (start === 'start') {
                            EAM.Utils.debugMessage("afterrender function called HDR !");
                            var formPanel = this.getFormPanel();
                            var headerStatus = formPanel.getFldValue("workorderstatus");
                            var userGroup = getUserGroup();
                            EAM.Utils.debugMessage("User group is " + userGroup);
                            var vLoc1 = formPanel.getFld("udfchar19");
                            vLoc1DescFld = Ext.create('Ext.form.TextField', {
                                //fieldLabel: '',
                                margin: '5 0 0 5',
                                width: 350,
                                renderTo: vLoc1.id,
                                readOnly: true,
                                itemId: 'vLoc1DescFld'
                                //name: 'desc',
                                //id: 'desc'
                            });
                            if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                                protectAllFields('HDR', formPanel);
                                return;
                            } else {
                                protectHdrField(formPanel, "");
                            }

                            if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                                headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                                protectAllFields('HDR', formPanel);
                                return;
                            } else {
                                protectHdrField(formPanel, "");
                            }

                        }
                    } catch (e) {
                        EAM.Utils.debugMessage('Error in After Render : ' + e);
                    }
                },
                aftersaverecord: function (a, b, c) {
                    try {

                        EAM.Utils.debugMessage("aftersaverecord function called !");
                        var formPanel = this.getFormPanel();
                        var headerStatus = formPanel.getFldValue("workorderstatus");

                        vworkorderstatus = formPanel.getFldValue("workorderstatus");
                        var vUdfchar19 = formPanel.getFldValue("udfchar19");
                        EAM.Utils.debugMessage("supplier value is :" + vUdfchar19);
                        if (vUdfchar19 == '50406') {
                            var fields = {};
                            fields = {
                                'udfchar40': 'optional',
                            };
                        } else {
                            formPanel.setFldValue("udfchar40", "", true);
                            var fields = {};
                            fields = {
                                'udfchar40': 'protected',
                            };
                        }
                        EAM.Builder.setFieldState(fields, formPanel.getForm().getFields());
                        var userGroup = getUserGroup();
                        //clearPackageReturnFields();
                        //maintainFormPanelState(formPanel);
                        setPackageReturnFields(formPanel);
                        if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                            protectAllFields('HDR', formPanel);
                            return;
                        } else {
                            protectHdrField(formPanel, "");
                        }

                        if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                            headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                            protectAllFields('HDR', formPanel);
                            return;
                        } else {
                            protectHdrField(formPanel, "");
                        }

                    } catch (e) {
                        EAM.Utils.debugMessage('Error in After Render : ' + e);
                    }
                },
                beforesaverecord: function (a, b, c) {
                    try {

                        EAM.Utils.debugMessage("beforesaverecord function called !");
                        var formPanel = this.getFormPanel();
                        setPackageReturnFields(formPanel);
                    } catch (e) {
                        EAM.Utils.debugMessage('Error in beforesaverecord : ' + e);
                    }
                },
                afterrecordchange: function (a, b) {
                    EAM.Utils.debugMessage("afterrecordchange function called HDR!");
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.getFldValue("workorderstatus");
                    vworkorderstatus = formPanel.getFldValue("workorderstatus");
                    var userGroup = getUserGroup();
                    var vUdfchar19 = formPanel.getFldValue("udfchar19");

                    /*if(vSupp==""){
                    clearPackageReturnFields();
                    }*/
                    if (vCopyClicked == true) {
                        clearFldCopyRec(formPanel);
                    }
                    vCopyClicked = false;
                    setPackageReturnFields(formPanel);
                    var vUdfchar19 = formPanel.getFldValue("udfchar19");
                    EAM.Utils.debugMessage("supplier value is :" + vUdfchar19);
                    if (vUdfchar19 == '50406') {
                        var fields = {};
                        fields = {
                            'udfchar40': 'optional',
                        };
                    } else {
                        formPanel.setFldValue("udfchar40", "", true);
                        var fields = {};
                        fields = {
                            'udfchar40': 'protected',
                        };
                    }
                    EAM.Builder.setFieldState(fields, formPanel.getForm().getFields());

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields('HDR', formPanel);
                        return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields('HDR', formPanel);
                        return;
                    } else {
                        protectHdrField(formPanel, "");
                    }
                },
                afterloadrecord: function (a) {
                    try {

                        EAM.Utils.debugMessage('afterloadrecord event called');
                        var formPanel = this.getFormPanel();
                        if (this.getFormPanel().getGrid().getSelectionModel().hasSelection()) {
                            var vgrid = this.getFormPanel().getGrid().getSelectionModel().getSelection()[0];
                            vLoc1DescFld.setValue(vgrid.data.description);
                        } else {
                            clearPackageReturnFields();
                        }
                    } catch (err) {
                        EAM.Utils.debugMessage('Error in afterloadrecord ' + err);
                    }
                },
                afterreset: function (a, b) {
                    try {

                        var formPanel = this.getFormPanel();
                        var headerStatus = formPanel.getFldValue("workorderstatus");
                        var userGroup = getUserGroup();
                        clearPackageReturnFields();
                        if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                            protectAllFields('HDR', formPanel);
                            return;
                        } else {
                            protectHdrField(formPanel, "");
                        }

                        if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                            headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                            protectAllFields('HDR', formPanel);
                            return;
                        } else {
                            protectHdrField(formPanel, "");
                        }
                    } catch (err) {
                        EAM.Utils.debugMessage('Error in afterreset ' + err);
                    }

                },
                afterdestroyrecord: function (a, b, c) {

                    try {
                        EAM.Utils.debugMessage('afterdestroyrecord event called');
                        var formPanel = this.getFormPanel();

                        clearPackageReturnFields();

                    } catch (err) {
                        EAM.Utils.debugMessage("afterdestroyrecord err :" + err);
                    }

                }
            },

            '[extensibleFramework] uxtabpanel[itemId=tabContent]': {
                aftertabchange: function (field, event) {

                    var formPanel = this.getFormPanel();
                    EAM.Utils.debugMessage("aftertabchange called!");
                    //overridelovfield(formPanel, field);

                },
                beforetabchange: function (field, event) {

                    var formPanel = this.getFormPanel();
                    EAM.Utils.debugMessage("beforetabchange called!");
                    maintainFormPanelState(formPanel);
                    //overridelovfield(formPanel, field);

                }
            },
            '[extensibleFramework] [tabName=HDR] lovfield[name=udfchar19]': {
                beforetriggerclick: function (field, event) {
                    var formPanel = this.getFormPanel();
                    EAM.Utils.debugMessage("beforetriggerclick of udfchar19 called !");
                    hdr_overridereqbylov(field);

                },

                customonblur: function () {
                    var formPanel = this.getFormPanel();
                    setPackageReturnFields(formPanel);
                    var vUdfchar19 = formPanel.getFldValue("udfchar19");
                    EAM.Utils.debugMessage("supplier value is :" + vUdfchar19);
                    if (vUdfchar19 == '50406') {
                        var fields = {};
                        fields = {
                            'udfchar40': 'optional',
                        };
                    } else {
                        formPanel.setFldValue("udfchar40", "", true);
                        EAM.Utils.debugMessage("UserDefineField 40 is Empty!!");
                        var fields = {};
                        fields = {
                            'udfchar40': 'protected',
                        };
                    }
                    EAM.Builder.setFieldState(fields, formPanel.getForm().getFields());
                }

            },
            '[extensibleFramework] [tabName=U1] lovfield[name=wspf_10_ou_parts]': {
                beforetriggerclick: function (field, event) {
                    var formPanel = this.getFormPanel();
                    EAM.Utils.debugMessage("beforetriggerclick of wspf_10_ou_parts called !");
                    overridelovfield(formPanel, field);
                    maintainFormPanelState(formPanel);

                },
                customonblur: function (a, b) {
                    var formPanel = this.getFormPanel();
                    vCatPriceAttributeChanges(formPanel);
                    partcodeDescPopulate(formPanel);
                    if (Ext.isEmpty(a.getValue())) {
                        formPanel.clearFldValues(['wspf_10_ou_partdes']);
                    }
                    maintainFormPanelState(formPanel);
                }
            },
            '[extensibleFramework] [tabName=U1] lovfield[name=wspf_10_ou_partuom]': {
                beforetriggerclick: function (field, event) {
                    var formPanel = this.getFormPanel();
                    EAM.Utils.debugMessage("beforetriggerclick of wspf_10_ou_partuom called !");
                    overrideBaselovfield(field);
                    maintainFormPanelState(formPanel);

                }
            },
            '[extensibleFramework] [tabName=U1] lovfield[name=wspf_10_ou_toh]': {
                beforetriggerclick: function (field, event) {
                    var formPanel = this.getFormPanel();
                    EAM.Utils.debugMessage("beforetriggerclick of wspf_10_ou_toh called !");
                    overridelovfield(formPanel, field);
                    maintainFormPanelState(formPanel);

                }
            },
            '[extensibleFramework] [tabName=HDR] lovfield[name=equipment]': {
                customonblur: function () {
                    EAM.Utils.debugMessage("custom onblur called for equipment");
                    var formPanel = this.getFormPanel();
                    protectFields(formPanel);
                },
                beforetriggerclick: function (field, event) {
                    var formPanel = this.getFormPanel();
                    EAM.Utils.debugMessage("beforetriggerclick of equipment called !");
                    start = "second";

                }
            },
            '[extensibleFramework] [tabName=HDR] lovfield[name=organization]': {
                customonblur: function () {
                    EAM.Utils.debugMessage("custom onblur called for organization");
                    var formPanel = this.getFormPanel();
                    var vUdfchar19 = formPanel.getFldValue("udfchar19");
                    EAM.Utils.debugMessage("supplier value is :" + vUdfchar19);
                    if (vUdfchar19 == '50406') {
                        var fields = {};
                        fields = {
                            'udfchar40': 'optional',
                        };
                    } else {
                        formPanel.setFldValue("udfchar40", "", true);
                        var fields = {};
                        fields = {
                            'udfchar40': 'protected',
                        };
                    }
                    EAM.Builder.setFieldState(fields, formPanel.getForm().getFields());
                }
            },
            '[extensibleFramework] [tabName=U1][isTabView=true]': {
                afterrender: function (a, b) {
                    try {
                        EAM.Utils.debugMessage("afterrender function called !");

                        var formPanel = this.getFormPanel();
                        var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                        if (vFieldContainerPart == "") {
                            setU1_Layout(formPanel);
                            EAM.Builder.setFieldState({
                                'wspf_10_ou_partdes': 'protected'
                            }, formPanel.getForm().getFieldsAndButtons());
                            vFieldContainerPart = "";
                        }
                        var userGroup = getUserGroup();

                        if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                            protectAllFields(userFunctionTab, formPanel);
                            //return;
                        } else {
                            protectHdrField(formPanel, "");
                        }

                        if (userGroup === "R5") {
                            resetButtons(a.tabName, formPanel);
                            setU1DefaultValues(formPanel, "");
                            var vparts = formPanel.getFld("wspf_10_ou_others").checked;
                            addNewPartFieldAttribute(formPanel, vparts);

                        } else {
                            if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                                (userGroup === "SUPPLIER" && headerStatus === "CAL") ||
                                headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF" || headerStatus === "C") {
                                protectAllFields(userFunctionTab, formPanel);
                                //return;
                            } else {
                                resetButtons(a.tabName, formPanel);
                                setU1DefaultValues(formPanel, "");
                                var vparts = formPanel.getFld("wspf_10_ou_others").checked;
                                addNewPartFieldAttribute(formPanel, vparts);
                            }
                        }

                        setDropDowns(formPanel, "wspf_10_ou_act");
                        setActivityStore(formPanel);
                        gActivityValue = formPanel.getFldValue("wspf_10_ou_act");
                        handleVirtualActFld(formPanel);

                    } catch (e) {
                        EAM.Utils.debugMessage('Error in After Render : ' + e);
                    }
                },
                afterloadrecord: function (a, b, c) {
                    EAM.Utils.debugMessage("afterloadrecord function called !");
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    setActivityStore(formPanel);
                    gActivityValue = formPanel.getFldValue("wspf_10_ou_act");
                    var userGroup = getUserGroup();
                    vCatalogueReferenceOld = formPanel.getFldValue('wspf_10_ou_catalogue');

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(userFunctionTab, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                        vCatPriceAttributeChanges(formPanel);
                    }

                    if (userGroup === "R5") {
                        resetButtons(a.tabName, formPanel);
                        setU1DefaultValues(formPanel, "");
                        var vparts = formPanel.getFld("wspf_10_ou_others").checked;
                        addNewPartFieldAttribute(formPanel, vparts);
                        vCatPriceAttributeChanges(formPanel);

                    } else {
                        if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                            (userGroup === "SUPPLIER" && headerStatus === "CAL") ||
                            headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF" || headerStatus === "C") {
                            protectAllFields(userFunctionTab, formPanel);
                            //return;
                        } else {
                            resetButtons(a.tabName, formPanel);
                            setU1DefaultValues(formPanel, "");
                            var vparts = formPanel.getFld("wspf_10_ou_others").checked;
                            addNewPartFieldAttribute(formPanel, vparts);
                            vCatPriceAttributeChanges(formPanel);
                        }
                    }

                    partcodeDescPopulate(formPanel);
                    EAM.Builder.setFieldState({
                        'wspf_10_ou_partdes': 'protected'
                    }, formPanel.getForm().getFieldsAndButtons());
                    maintainFormPanelState(formPanel);
                },
                afterrecordchange: function (a, b) {
                    EAM.Utils.debugMessage("afterrecordchange function called U1!");
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    console.log('headerStatus', headerStatus);
                    gActivityValue = formPanel.getFldValue("wspf_10_ou_act");

                    var userGroup = getUserGroup();
                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        console.log('Enter Block - 0');
                        protectAllFields(userFunctionTab, formPanel);
                        //return;
                    } else {
                        console.log('Enter Block - 1');
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        (userGroup === "SUPPLIER" && headerStatus === "CAL") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF" || headerStatus === "C") {
                        console.log('Enter Block - 2');
                        protectAllFields(userFunctionTab, formPanel);
                        //return;
                    } else {
                        console.log('Enter Block - 3');
                        resetButtons(a.tabName, formPanel);
                        setU1DefaultValues(formPanel, "");
                        var vparts = formPanel.getFld("wspf_10_ou_others").checked;
                        addNewPartFieldAttribute(formPanel, vparts);
                    }
                    handleVirtualActFld(formPanel);
                    maintainFormPanelState(formPanel);
                    EAM.Builder.setFieldState({
                        'wspf_10_ou_partdes': 'protected'
                    }, formPanel.getForm().getFieldsAndButtons());
                    var resetButton = EAM.Utils.getMainToolbar().getResetButton();
                    resetButton.fireEvent("click", resetButton);
                },
                afternewrecord: function (a) {
                    EAM.Utils.debugMessage("afterrender function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();
                    setActivityStore(formPanel);
                    gActivityValue = formPanel.getFldValue("wspf_10_ou_act");
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(userFunctionTab, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        (userGroup === "SUPPLIER" && headerStatus === "CAL") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF" || headerStatus === "C") {
                        protectAllFields(userFunctionTab, formPanel);
                        //return;

                    } else {
                        resetButtons(a.tabName, formPanel);
                        setU1DefaultValues(formPanel, "");
                        var vparts = formPanel.getFld("wspf_10_ou_others").checked;
                        addNewPartFieldAttribute(formPanel, vparts);
                    }
                    EAM.Builder.setFieldState({
                        'wspf_10_ou_partdes': 'protected'
                    }, formPanel.getForm().getFieldsAndButtons());
                },
                afterreset: function (a) {
                    EAM.Utils.debugMessage("afterrender function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();
                    setActivityStore(formPanel);
                    gActivityValue = formPanel.getFldValue("wspf_10_ou_act");
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(userFunctionTab, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        (userGroup === "SUPPLIER" && headerStatus === "CAL") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF" || headerStatus === "C") {
                        protectAllFields(userFunctionTab, formPanel);
                        //return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                        setU1DefaultValues(formPanel, "");
                        var vparts = formPanel.getFld("wspf_10_ou_others").checked;
                        addNewPartFieldAttribute(formPanel, vparts);
                    }
                    EAM.Builder.setFieldState({
                        'wspf_10_ou_partdes': 'protected'
                    }, formPanel.getForm().getFieldsAndButtons());
                },
                aftersaverecord: function (a, b, c, d) {
                    if (d.pageData.success == true) {
                        EAM.Utils.debugMessage("aftersaverecord function called !");
                        var formPanel = this.getFormPanel();
                        var formPanel = this.getFormPanel();
                        setActivityStore(formPanel);
                        gActivityValue = formPanel.getFldValue("wspf_10_ou_act");

                        var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                        var userGroup = getUserGroup();
                        if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                            protectAllFields(userFunctionTab, formPanel);
                            //return;
                        } else {
                            protectHdrField(formPanel, "");
                        }

                        if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                            (userGroup === "SUPPLIER" && headerStatus === "CAL") ||
                            headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF" || headerStatus === "C") {
                            protectAllFields(userFunctionTab, formPanel);
                            //return;
                        } else {
                            resetButtons(a.tabName, formPanel);
                            setU1DefaultValues(formPanel, "");
                            var vparts = formPanel.getFld("wspf_10_ou_others").checked;
                            addNewPartFieldAttribute(formPanel, vparts);
                        }
                        EAM.Builder.setFieldState({
                            'wspf_10_ou_partdes': 'protected'
                        }, formPanel.getForm().getFieldsAndButtons());
                    }
                },
                afterdestroyrecord: function (a, b, c) {
                    EAM.Utils.debugMessage("aftersaverecord function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();
                    setActivityStore(formPanel);
                    gActivityValue = formPanel.getFldValue("wspf_10_ou_act");
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(userFunctionTab, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        (userGroup === "SUPPLIER" && headerStatus === "CAL") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF" || headerStatus === "C") {
                        protectAllFields(userFunctionTab, formPanel);
                        //return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                        setU1DefaultValues(formPanel, "");
                        var vparts = formPanel.getFld("wspf_10_ou_others").checked;
                        addNewPartFieldAttribute(formPanel, vparts);
                    }
                    EAM.Builder.setFieldState({
                        'wspf_10_ou_partdes': 'protected'
                    }, formPanel.getForm().getFieldsAndButtons());

                },
                before_eam_beforesaverecord: function (a, b, c) {
                    if (a.userFunction === "WSJOBO" && a.tabName === "U1") {

                        var formPanel = this.getFormPanel();
                        setLineNo(formPanel);
                        var vPageMode = formPanel.getFldValue("pagemode");
                        /*Security for N-Parts in new tab on WSJOBO*/
                        var vCatalogueReferenceNew = formPanel.getFldValue('wspf_10_ou_catalogue');
                        var vCatalogPrice = formPanel.getFldValue('wspf_10_ou_catprice');
                        var vParts = formPanel.getFldValue("wspf_10_ou_parts");
                        console.log('CatalogueReference new value' + vCatalogueReferenceNew + "  CatalogueReference old value" + vCatalogueReferenceOld);

                        if (vPageMode == "display" || (vPageMode == "view" && !(vCatalogueReferenceNew === vCatalogueReferenceOld))) {
                            var vShowError = getSecurityNParts(formPanel, vCatalogueReferenceNew);
                            if (vShowError == "Y") {
                                var VuserLang = EAM.AppData.getInstallParams().get("language");
                                if (VuserLang === "NL") {
                                    EAM.Messaging.showError('Er bestaat al een artikel met deze catalogus referentie.');
                                } else {
                                    EAM.Messaging.showError('Part already exists with this Catalogue Reference.');
                                }
                                return false;
                            }

                        }

                        if (vParts && vCatalogPrice <= 0) { // Changed <== to <=
                            var VuserLang = EAM.AppData.getInstallParams().get("language");
                            if (VuserLang === "NL") { /*Error Message Change SPC-630*/
                                EAM.Messaging.showError('Catalogus waarde Moet groter zijn dan 0.'); // Dutch message
                                formPanel.setFldValue('wspf_10_ou_catprice', "");
                            } else {
                                EAM.Messaging.showError('Catalog Price must be greater than 0.'); // English message
                                formPanel.setFldValue('wspf_10_ou_catprice', "");
                            }
                            return false;
                        }
                        /*SPC-630*/
                        var vPricePerH = formPanel.getFldValue("wspf_10_ou_pricep");
                        var vTypeHours = formPanel.getFldValue("wspf_10_ou_toh");
                        var vNoHours = formPanel.getFldValue("wspf_10_ou_hrs");
                        if (vTypeHours && vNoHours) {
                            if (vPricePerH <= 0) { // Check if the value is zero or less
                                var vUserLang = EAM.AppData.getInstallParams().get("language");
                                if (vUserLang === "NL") {
                                    EAM.Messaging.showError('Prijs per uur Moet groter zijn dan 0.');
                                } else {
                                    EAM.Messaging.showError('Price Per H must be greater than 0.');
                                }
                                return false;
                            }
                        }
                        var vPartExit = formPanel.getFld("wspf_10_ou_others").checked;
                        var vPrice = formPanel.getFldValue("wspf_10_ou_partprice");
                        if (vPartExit) {
                            if (vPrice <= 0) { // Check if the value is zero or less
                                var vUserLang = EAM.AppData.getInstallParams().get("language");
                                if (vUserLang === "NL") {
                                    EAM.Messaging.showError('Prijs Moet groter zijn dan 0.');
                                } else {
                                    EAM.Messaging.showError('Price must be greater than 0.');
                                }
                                return false;
                            }

                        }

                    }
                }
            },
            '[extensibleFramework] [tabName=U1] checkbox[name=wspf_10_ou_others]': {
                change: function () {
                    EAM.Utils.debugMessage("change function called");
                    var formPanel = this.getFormPanel();
                    var vparts = formPanel.getFld("wspf_10_ou_others").checked;
                    EAM.Utils.debugMessage("Part Not Exist is " + vparts);
                    addNewPartFieldAttribute(formPanel, vparts);
                    partcodeDescPopulate(formPanel);
                }
            },
            '[extensibleFramework] [tabName=ACT]': {
                afterrender: function (a, b) {
                    try {
                        EAM.Utils.debugMessage("afterrender function called !");

                        var formPanel = this.getFormPanel();
                        var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                        var userGroup = getUserGroup();

                        if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                            protectAllFields(a.tabName, formPanel);
                            //return;
                        } else {
                            protectHdrField(formPanel, "");
                        }

                        if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                            headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                            protectAllFields(a.tabName, formPanel);
                            return;
                        } else {
                            resetButtons(a.tabName, formPanel);
                        }

                    } catch (e) {
                        EAM.Utils.debugMessage('Error in After Render : ' + e);
                    }
                },
                afterloadrecord: function (a, b, c) {
                    EAM.Utils.debugMessage("afterloadrecord function called !");
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(a.tabName, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields(a.tabName, formPanel);
                        return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                    }

                },
                afterrecordchange: function (a, b) {
                    EAM.Utils.debugMessage("afterrender function called !");
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(a.tabName, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields(a.tabName, formPanel);
                        return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                    }

                },
                afternewrecord: function (a) {
                    EAM.Utils.debugMessage("afterrender function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(a.tabName, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields(a.tabName, formPanel);
                        return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                    }

                },
                afterreset: function (a) {
                    EAM.Utils.debugMessage("afterrender function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(a.tabName, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields(a.tabName, formPanel);
                        return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                    }
                },
                aftersaverecord: function (a, b, c) {
                    EAM.Utils.debugMessage("aftersaverecord function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(a.tabName, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields(a.tabName, formPanel);
                        return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                    }
                },
                afterdestroyrecord: function (a, b, c) {
                    EAM.Utils.debugMessage("aftersaverecord function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(a.tabName, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields(a.tabName, formPanel);
                        return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                    }
                }
            },
            '[extensibleFramework] [tabName=CLO]': {
                afterrender: function (a, b) {
                    try {
                        EAM.Utils.debugMessage("afterrender function called !");

                        var formPanel = this.getFormPanel();
                        var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                        var userGroup = getUserGroup();

                        if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                            protectAllFields(a.tabName, formPanel);
                            //return;
                        } else {
                            protectHdrField(formPanel, "");
                        }

                        if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                            headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                            protectAllFields(a.tabName, formPanel);
                            return;
                        } else {
                            resetButtons(a.tabName, formPanel);
                        }

                    } catch (e) {
                        EAM.Utils.debugMessage('Error in After Render : ' + e);
                    }
                },
                afterloadrecord: function (a, b, c) {
                    EAM.Utils.debugMessage("afterloadrecord function called !");
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(a.tabName, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields(a.tabName, formPanel);
                        return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                    }

                },
                afterrecordchange: function (a, b) {
                    EAM.Utils.debugMessage("afterrender function called !");
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(a.tabName, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields(a.tabName, formPanel);
                        return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                    }

                },
                afternewrecord: function (a) {
                    EAM.Utils.debugMessage("afterrender function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(a.tabName, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields(a.tabName, formPanel);
                        return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                    }

                },
                afterreset: function (a) {
                    EAM.Utils.debugMessage("afterrender function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(a.tabName, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields(a.tabName, formPanel);
                        return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                    }
                },
                aftersaverecord: function (a, b, c) {
                    EAM.Utils.debugMessage("aftersaverecord function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(a.tabName, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields(a.tabName, formPanel);
                        return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                    }
                },
                afterdestroyrecord: function (a, b, c) {
                    EAM.Utils.debugMessage("aftersaverecord function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(a.tabName, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields(a.tabName, formPanel);
                        return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                    }
                }
            },
            '[extensibleFramework] [tabName=CMT]': {
                afterrender: function (a, b) {
                    try {
                        EAM.Utils.debugMessage("afterrender function called !");

                        var formPanel = this.getFormPanel();
                        var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                        var userGroup = getUserGroup();

                        if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                            protectAllFields(a.tabName, formPanel);
                            //return;
                        } else {
                            protectHdrField(formPanel, "");
                        }

                        if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                            headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                            protectAllFields(a.tabName, formPanel);
                            return;
                        } else {
                            resetButtons(a.tabName, formPanel);
                        }

                    } catch (e) {
                        EAM.Utils.debugMessage('Error in After Render : ' + e);
                    }
                },
                afterloadrecord: function (a, b, c) {
                    EAM.Utils.debugMessage("afterloadrecord function called !");
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(a.tabName, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields(a.tabName, formPanel);
                        return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                    }

                },
                afterrecordchange: function (a, b) {
                    EAM.Utils.debugMessage("afterrender function called !");
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(a.tabName, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields(a.tabName, formPanel);
                        return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                    }

                },
                afternewrecord: function (a) {
                    EAM.Utils.debugMessage("afterrender function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(a.tabName, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields(a.tabName, formPanel);
                        return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                    }

                },
                afterreset: function (a) {
                    EAM.Utils.debugMessage("afterrender function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(a.tabName, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields(a.tabName, formPanel);
                        return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                    }
                },
                aftersaverecord: function (a, b, c) {
                    EAM.Utils.debugMessage("aftersaverecord function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(a.tabName, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields(a.tabName, formPanel);
                        return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                    }
                },
                afterdestroyrecord: function (a, b, c) {
                    EAM.Utils.debugMessage("aftersaverecord function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
                    var userGroup = getUserGroup();

                    if ((userGroup === "SUPPLIER" && headerStatus === "CAL")) {
                        protectAllFields(a.tabName, formPanel);
                        //return;
                    } else {
                        protectHdrField(formPanel, "");
                    }

                    if ((userGroup === "VLOOT-MAN" && headerStatus === "DI") ||
                        headerStatus === "AG" || headerStatus === "CA" || headerStatus === "TF") {
                        protectAllFields(a.tabName, formPanel);
                        return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                    }
                }
            },
            '[extensibleFramework] maintoolbar button[action=copyRec]': {
                click: function (a, b, c) {
                    try {
                        EAM.Utils.debugMessage('copy record button clicked');
                        var formPanel = this.getFormPanel();

                        // clearFldCopyRec(formPanel);

                        vCopyClicked = true;
                    } catch (err) {
                        EAM.Utils.debugMessage("copy record button click err :" + err);
                    }
                }
            },
            '[extensibleFramework] [tabName=HDR] uxcombobox[name=workordertype]': {
                select: function (a, b) {
                    try {
                        EAM.Utils.debugMessage('workordertype is select!!');
                        var formPanel = this.getFormPanel();
                        var vworkOrdertype = formPanel.getFldValue("workordertype");
                        EAM.Utils.debugMessage("workordertype select value " + vworkOrdertype);
                        protectFields(formPanel);
                    } catch (err) {
                        EAM.Utils.debugMessage('workordertype select error' + err);
                    }
                }
            },

        }
    }

});
function setDropDowns(formPanel, fieldName) {
    console.log("createDropDowns() Called!!!");
    var vFld = formPanel.getFld(fieldName);
    // var vFldParentContainer = vFld.up('container');
    var vFldParentContainer = vFld.up('container'),
    contitemscount = vFldParentContainer.items.length;
    var vFldIndx = 0;
    for (var i = 0; i < vFldParentContainer.items.length; i++) {
        var item = vFldParentContainer.items.items[i];
        vFldIndx++;
        if (item.name == "wspf_10_ou_line") {
            break;
        }
    }
    var requestData = {
        GRID_NAME: "LVSUPACT",
        GRID_TYPE: "LOV",
        REQUEST_TYPE: "LOV.HEAD_DATA.STORED",
        LOV_ALIAS_NAME_1: "parameter.eventnum",
        LOV_ALIAS_VALUE_1: formPanel.getFldValue("wspf_10_ou_wo"),
        LOV_ALIAS_TYPE_1: "text",
        LOV_ALIAS_NAME_2: "parameter.language",
        LOV_ALIAS_VALUE_2: EAM.AppData.getLanguage(),
        CURRENT_TAB_NAME: userFunctionTab,
        USER_FUNCTION_NAME: userFunction,
        SYSTEM_FUNCTION_NAME: "BSUDSC",
        COMPONENT_INFO_TYPE: "DATA_ONLY"
    };

    var response = EAM.Ajax.request({
        url: "LOVPOP",
        params: requestData
    });
    var vrecords = response.responseData.pageData.grid.GRIDRESULT.GRID.DATA;
    var vdata = [];
    for (var i = 0; i < vrecords.length; i++) {
        vdata.push({
            "abbr": vrecords[i].lvsupactcode,
            "name": vrecords[i].lvsupactdesc
        });
    }

    dropDownStore = Ext.create('Ext.data.Store', {
        fields: ['abbr', 'name'],
        data: vdata
    });
    var LABEL_DT = "Activiteit"
        var LABEL_EN = "Activity"
        var vLabel = getFieldLabel(LABEL_DT, LABEL_EN);
    myDropDown = Ext.create('Ext.form.ComboBox', {
        fieldLabel: vLabel,
        id: 'myDropDown',
        name: 'custstatus',
        store: dropDownStore,
        queryMode: 'local',
        displayField: 'name',
        valueField: 'abbr',
        typeAhead: 1,
        typeAheadDelay: 250,
        assertValue: function () {

            console.log("assertValue called for status");
            var a = this,
            e = a.getRawValue(),
            d = a.getDisplayValue(),
            c = a.lastSelectedRecords,
            g = !1,
            f,
            b;
            b = a.findRecordByDisplay(f);
            if (b && (b !== (c && c[0]) || a.displayField !== a.valueField)) {
                a.select(b, !0);
                a.fireEvent('select', a, b)
            } else {
                var check = "NOTDIRTY";
                if (!Ext.isEmpty(c)) {
                    a.setValue(c[0].data.name);
                    if (c[0].data.abbr == gActivityValue) {
                        check = "DIRTY";
                    }
                } else {
                    var vActivityCode = gActivityValue;
                    var availableActivity = a.store.config.data;
                    var vActivityDesc = "";
                    if (vActivityCode == "-") {
                        vActivityDesc = availableActivity[0].name;
                    } else {
                        for (var i = 0; i < availableActivity.length; i++) {
                            if (vActivityCode == availableActivity[i].abbr) {
                                vActivityDesc = availableActivity[i].name;
                                break;
                            }
                        }
                    }
                    a.setValue(vActivityDesc);
                    check = "DIRTY";
                }
                if (check == "DIRTY") {
                    if (a.mixins && a.mixins.field && typeof a.mixins.field['initValue'] == 'function') {
                        a.mixins.field.initValue.apply(a);
                        a.wasDirty = false;
                    }
                }
            }

            a.collapse()
        },
        listeners: {
            'select': function (combo, records) {
                vcurrentRecord = records.data.abbr;
                EAM.Utils.debugMessage("value of selected record : " + vcurrentRecord)
                var vPageMode = formPanel.getFldValue("pagemode");
                //if (vPageMode === "display") {
                //    formPanel.setFldValue("wspf_10_ou_act", "-", true);
                //} else if (vPageMode === "view") {
                formPanel.setFldValue("wspf_10_ou_act", vcurrentRecord, true);
                var actFld = formPanel.getFld("wspf_10_ou_act");
                actFld.fireEvent('customonblur', actFld, vcurrentRecord);
                //}
            }
        }
    });

    var isExist = false;

    for (var i = 0; i < vFldParentContainer.items.length; i++) {
        var item = vFldParentContainer.items.items[i];
        if (item.id == "myDropDown") {
            isExist = true;
            break;
        }
    }
    if (isExist == false) {
        EAM.Utils.debugMessage('Activity  creation');
        vFldParentContainer.add(vFldIndx, myDropDown);
        isExist = true;
    }
    // vFldParentContainer.add(+vFldIndx + 1, myDropDown);
    //formPanel.setFldValue("myDropDown", vdata[0].abbr, true);
    //formPanel.setFldValue("wspf_10_ou_act", vdata[0].abbr, true);
    //gActivityValue = formPanel.getFldValue("wspf_10_ou_act");

};
function protectFields(formPanel) {
    try {
        EAM.Utils.debugMessage("protectField function called !");
        gStatusValue = formPanel.getFldValue("workorderstatus");
        if (gStatusValue === "AL") {
            h = {
                "udfchar22": "required"
            };
            EAM.Builder.setFieldState(h, formPanel.getForm().getFields());

        } else {
            h = {
                "udfchar22": "protected"
            };
            EAM.Builder.setFieldState(h, formPanel.getForm().getFields());
        }

        var userGroup = getUserGroup();
        if (userGroup === "SUPPLIER") {
            h = {
                "udfchar19": "protected"
            };
            EAM.Builder.setFieldState(h, formPanel.getForm().getFields());
        } else if (gStatusValue === "W") {
            h = {
                "udfchar19": "optional"
            };
            EAM.Builder.setFieldState(h, formPanel.getForm().getFields());

        } else {
            h = {
                "udfchar19": "protected"
            };
            EAM.Builder.setFieldState(h, formPanel.getForm().getFields());
        }

        var vUdfchar19 = formPanel.getFldValue("udfchar19");
        EAM.Utils.debugMessage("supplier value is :" + vUdfchar19);
        if (vUdfchar19 == '50406') {
            var fields = {};
            fields = {
                'udfchar40': 'optional',
            };
        } else {
            formPanel.setFldValue("udfchar40", "", true);
            var fields = {};
            fields = {
                'udfchar40': 'protected',
            };
        }
        EAM.Builder.setFieldState(fields, formPanel.getForm().getFields());

    } catch (err) {
        EAM.Utils.debugMessage("Error in protectField function is " + err);
    }
};

function protectHdrField(formPanel, pAction) {
    try {
        EAM.Utils.debugMessage("protectHdrField function called !");

        gStatusValue = formPanel.getFldValue("workorderstatus");
        if (gStatusValue === "AL") {
            h = {
                "udfchar22": "required"
            };
            EAM.Builder.setFieldState(h, formPanel.getForm().getFields());

        } else {
            h = {
                "udfchar22": "protected"
            };
            EAM.Builder.setFieldState(h, formPanel.getForm().getFields());
        }
        var userGroup = getUserGroup();
        if (userGroup === "SUPPLIER") {
            h = {
                "udfchar19": "protected"
            };
            EAM.Builder.setFieldState(h, formPanel.getForm().getFields());
        } else if (gStatusValue === "W") {
            h = {
                "udfchar19": "optional"
            };
            EAM.Builder.setFieldState(h, formPanel.getForm().getFields());

        } else {
            h = {
                "udfchar19": "protected"
            };
            EAM.Builder.setFieldState(h, formPanel.getForm().getFields());
        }
        var vPageMode = formPanel.getFldValue("pagemode");
        if (vPageMode === "view") {
            h = {
                "equipment": "protected",
                "department": "protected",
                "workordertype": "protected",
                "problemcode": "protected",
                "priority": "protected"
            };
            EAM.Builder.setFieldState(h, formPanel.getForm().getFields());

        }
    } catch (err) {
        EAM.Utils.debugMessage("Error in protectHdrField function is " + err);
    }
};
function getUserGroup() {
    var requestData = {
        GRID_NAME: "QUUGRP",
        GRID_TYPE: "LOV",
        REQUEST_TYPE: "LOV.HEAD_DATA.STORED",
        LOV_ALIAS_NAME_1: "parameter.usrcode",
        LOV_ALIAS_VALUE_1: EAM.AppData.getUser(),
        LOV_ALIAS_TYPE_1: "text",
        CURRENT_TAB_NAME: "HDR",
        USER_FUNCTION_NAME: "QUUGRP",
        SYSTEM_FUNCTION_NAME: "BSUDSC",
        COMPONENT_INFO_TYPE: "DATA_ONLY"
    };

    var response = EAM.Ajax.request({
        url: "LOVPOP",
        params: requestData
    });
    return response.responseData.pageData.grid.GRIDRESULT.GRID.DATA[0].usrgroup;
};
function setLineNo(formPanel) {
    //Setting next sequence no on TAB
    var vWoSeq = getSequenceNo(formPanel.getFldValue("wspf_10_ou_wo"), formPanel.screen._listView.activeRecord.data.organization, formPanel.screen._listView.activeRecord.data.workorderrtype);
    if (vWoSeq === 0) {
        if (Ext.isEmpty(formPanel.getFldValue("wspf_10_ou_line"))) {

            formPanel.setFldValue("wspf_10_ou_line", 10, true);
        }
    } else {
        if (Ext.isEmpty(formPanel.getFldValue("wspf_10_ou_line"))) {
            vWoSeq = vWoSeq.replaceAll(',', '');
            vWoSeq = vWoSeq.replaceAll('.', '');
            var maxLineNumber = Number(vWoSeq);
            formPanel.setFldValue("wspf_10_ou_line", +maxLineNumber + 10, true);
        }
    }
};
function setU1DefaultValues(formPanel, pAction) {
    EAM.Utils.debugMessage("setU1DefaultValues function called !");

    var todayDate = new Date();
    todayDate = Ext.Date.format(todayDate, 'm/d/Y H:i');
    console.log("todayDate: " + todayDate);
    formPanel.setFldValue("wspf_10_ou_date1", todayDate, true);
    formPanel.setFldValue("wspf_10_ou_date", todayDate, true);
    formPanel.setFldValue("wspf_10_ou_date2", todayDate, true);

    maintainFormPanelState(formPanel);
};
function getSequenceNo(vWoCode, woOrganization, woType) {
    try {
        var vRequest = {
            SYSTEM_FUNCTION_NAME: "BSUDSC",
            USER_FUNCTION_NAME: userFunction,
            CURRENT_TAB_NAME: userFunctionTab,
            workordernum: vWoCode,
            organization: woOrganization,
            workorderrtype: woType,
            GRID_NAME: userFunction + '_' + userFunctionTab,
            ADDON_SORT_ELEMENT_ALIAS_NAME: 'wspf_10_ou_line',
            ADDON_SORT_ELEMENT_TYPE: 'DESC',
            COMPONENT_INFO_TYPE: 'DATA_ONLY',
        };
        var response = EAM.Ajax.request({
            url: "BSUDSC.TAB.xmlhttp",
            params: vRequest
        });
        var vSeq = "";
        var vrecords = response.responseData.pageData.grid.GRIDRESULT.GRID.DATA;
        if (vrecords.length > 0) {
            vSeq = vrecords[0].wspf_10_ou_line
        } else if (vrecords.length === 0) {
            vSeq = 0;
        }
        return vSeq;
    } catch (err) {
        EAM.Utils.debugMessage("getSequenceNo err :" + err);
    }

};
function overridelovfield(pFormPanel, pField) {
    try {
        EAM.Utils.debugMessage("overridelovfield function called !");

        DEBUG && console.log('pField');
        DEBUG && console.log(pField.name);
        DEBUG && console.log(pField);

        var vLovName = '';
        var vInputVars = {};
        var vReturnFields = {};
        var vClearFields = [];

        pField.extraLOVParams = null;

        if (pField.name == 'wspf_10_ou_parts') {
            vLovName = 'LVPARTSUP';
            vInputVars = {
                'parameter.workordernum': pFormPanel.getFldValue("wspf_10_ou_wo")
            };
            vReturnFields = {
                wspf_10_ou_parts: "lvpartsupcatcode",
                wspf_10_ou_partdes: "lvpartsupdesc"
            };
            clearFields: ["wspf_10_ou_parts", "wspf_10_ou_partdes"]
        } else if (pField.name == 'wspf_10_ou_toh') {
            vLovName = 'LVSUPHRS';
            vInputVars = {
                'parameter.language': EAM.AppData.getLanguage(),
                'parameter.wonum': pFormPanel.getFldValue("wspf_10_ou_wo"),
                'parameter.trde': pFormPanel.getFldValue("wspf_10_ou_trade")
            };
            vReturnFields = {
                wspf_10_ou_toh: "lvsupdescode"
            };
        }

        if (!Ext.isEmpty(vLovName)) {
            var vLookUpLOV = vValidateLOV = {
                lovName: vLovName,
                inputVars: vInputVars,
                returnFields: vReturnFields
            };

            vValidateLOV.clearFields = vClearFields;

            pField.lookupLOV = vLookUpLOV;
            pField.validateLOV = vValidateLOV;

            pField.extraLOVParams = pField.extraLOVParams || null;
            pField.isQueryCode = false;
            pField.fetchMoreRequestType = null;

            pField.validateOnBlur = true;
            pField.validateOnChange = true;
            pField.useBeforeValidateLOV = false;

            pField.dataspyConfig = {
                hideDataspyList: !1,
                hideEditButton: !1,
                hideExcelButton: !1,
                noFilterRow: !1,
                dataspyXType: 'dataspy'
            };
        }

        DEBUG && console.log('pField');
        DEBUG && console.log(pField);

        EAM.Utils.debugMessage("Code Executed : ");
    } catch (err) {
        EAM.Utils.debugMessage("overridelovfield err :" + err);
    }

};
function overrideBaselovfield(a) {
    try {
        console.log('overrideBaselovfield called');
        var pFormPanel = a.formPanel;
        var partfld = pFormPanel.getFld("wspf_10_ou_partuom");
        var vLookUpLOV = {
            lovName: 'LVUOMS',
            inputVars: {
                'parameter.mos': '+'
            },
            returnFields: {
                'wspf_10_ou_partuom': 'uomcode'
            }
        };
        a.lookupLOV = vLookUpLOV;
        a.validateLOV = vLookUpLOV;
        a.extraLOVParams = null;
        a.isQueryCode = false;
        a.fetchMoreRequestType = null;
        a.validateOnBlur = true;
        a.validateOnChange = true;
        a.useBeforeValidateLOV = false;
        a.dataspyConfig = {
            hideDataspyList: !1,
            hideEditButton: !1,
            hideExcelButton: !1,
            noFilterRow: !1,
            dataspyXType: 'dataspy'
        };
    } catch (err) {
        console.log('error in overrideBaselovfield : ' + err);
    }
};

function hdr_overridereqbylov(a) {
    try {
        console.log('hdr_overridereqbylov called');
        var pFormPanel = a.formPanel;

        var vLookUpLOV = {
            lovName: 'LVUDFE',
            inputVars: {
                'param.rentity': 'COMP',
                'param.field': 'udfchar19',
                'param.fieldid': 'udfchar19',
                'param.associatedrentity': 'EVNT',
                'param.lookuprentity': 'COMP'
            },
            inputFields: {
                'control.org': 'organization', // 'organization',
            },
            returnFields: {
                'udfchar19': 'userdefinedfieldvalue',
            }
        };

        a.lookupLOV = vLookUpLOV;
        a.validateLOV = vLookUpLOV;
        a.extraLOVParams = null;
        a.isQueryCode = false;
        a.fetchMoreRequestType = null;
        a.validateOnBlur = true;
        a.validateOnChange = true;
        a.useBeforeValidateLOV = false;
        a.dataspyConfig = {
            hideDataspyList: !1,
            hideEditButton: !1,
            hideExcelButton: !1,
            noFilterRow: !1,
            dataspyXType: 'dataspy'

        };
    } catch (err) {
        EAM.Utils.debugMessage('#Error in hdr_overridereqbylov() : ' + err);
    }
};
/***
 *** function to maintain
 *** formPanel State after adding
 *** creating custom fields
 ***/
function maintainFormPanelState(formPanel) {
    var items = formPanel.getForm().getFields().items,
    i = 0,
    len = items.length;
    for (; i < len; i++) {
        var c = items[i];
        if (c.mixins && c.mixins.field && typeof c.mixins.field['initValue'] == 'function') {
            c.mixins.field.initValue.apply(c);
            c.wasDirty = false;
        }
    }
};
function protectAllFields(tabName, formPanel) {

    var a = formPanel.getForm().getFieldsAndButtons();
    EAM.Utils.debugMessage("protectAllFields function called !");
    if (tabName === 'ACT' || tabName === 'CLO' || tabName === 'CMT' || tabName === 'U1' || tabName === 'HDR') {

        var h = {};

        for (var i = 0; i < a.keys.length; i++) {
            var c = a.keys[i];

            if ((tabName === 'HDR' && c === 'workorderstatus') || (tabName === 'U1' && c === 'wspf_10_ou_act') || (tabName === 'U1' && c === 'wspf_10_ou_wo')) {
                continue;
            }

            h[c] = "protected";

            if ((tabName === 'HDR' && c === 'syslevel')) {
                EAM.Utils.debugMessage("Entered into this");
                if (formPanel.getFld("syslevel").currentAttribute === "hidden") {
                    EAM.Utils.debugMessage("Entered here");
                    h[c] = "hidden";
                }
            }
            if ((tabName === 'HDR' && c === 'asslevel')) {
                EAM.Utils.debugMessage("Entered into this");
                if (formPanel.getFld("asslevel").currentAttribute === "hidden") {
                    EAM.Utils.debugMessage("Entered here");
                    h[c] = "hidden";
                }
            }
            if ((tabName === 'HDR' && c === 'complevel')) {
                EAM.Utils.debugMessage("Entered into this");
                if (formPanel.getFld("complevel").currentAttribute === "hidden") {
                    EAM.Utils.debugMessage("Entered here");
                    h[c] = "hidden";
                }
            }
            if ((tabName === 'HDR' && c === 'locationdesc')) {
                EAM.Utils.debugMessage("Entered into this");
                if (formPanel.getFld("locationdesc").currentAttribute === "hidden") {
                    EAM.Utils.debugMessage("Entered here");
                    h[c] = "hidden";
                }
            }
            if ((tabName === 'HDR' && c === 'location')) {
                EAM.Utils.debugMessage("Entered into this");
                if (formPanel.getFld("location").currentAttribute === "hidden") {
                    EAM.Utils.debugMessage("Entered here");
                    h[c] = "hidden";
                }
            }
            if ((tabName === 'HDR' && c === 'parentproperty')) {
                EAM.Utils.debugMessage("Entered into this");
                if (formPanel.getFld("parentproperty").currentAttribute === "hidden") {
                    EAM.Utils.debugMessage("Entered here");
                    h[c] = "hidden";
                }
            }
            if ((tabName === 'HDR' && c === 'parentpropertydesc')) {
                EAM.Utils.debugMessage("Entered into this");
                if (formPanel.getFld("parentpropertydesc").currentAttribute === "hidden") {
                    EAM.Utils.debugMessage("Entered here");
                    h[c] = "hidden";
                }
            }
            if ((tabName === 'HDR' && c === 'standardwo')) {
                EAM.Utils.debugMessage("Entered into this");
                if (formPanel.getFld("standardwo").currentAttribute === "hidden") {
                    EAM.Utils.debugMessage("Entered here");
                    h[c] = "hidden";
                }
            }
            if ((tabName === 'HDR' && c === 'categoryname')) {
                EAM.Utils.debugMessage("Entered into this");
                if (formPanel.getFld("categoryname").currentAttribute === "hidden") {
                    EAM.Utils.debugMessage("Entered here");
                    h[c] = "hidden";
                }
            }
            if ((tabName === 'HDR' && c === 'servicecategory')) {
                EAM.Utils.debugMessage("Entered into this");
                if (formPanel.getFld("servicecategory").currentAttribute === "hidden") {
                    EAM.Utils.debugMessage("Entered here");
                    h[c] = "hidden";
                }
            }
            if ((tabName === 'HDR' && c === 'supplier')) {
                EAM.Utils.debugMessage("Entered into this");
                if (formPanel.getFld("supplier").currentAttribute === "hidden") {
                    EAM.Utils.debugMessage("Entered here");
                    h[c] = "hidden";
                }
            }
            if ((tabName === 'HDR' && c === 'serviceproblemcode')) {
                EAM.Utils.debugMessage("Entered into this");
                if (formPanel.getFld("serviceproblemcode").currentAttribute === "hidden") {
                    EAM.Utils.debugMessage("Entered here");
                    h[c] = "hidden";
                }
            }
            if ((tabName === 'HDR' && c === 'supplierorg')) {
                EAM.Utils.debugMessage("Entered into this");
                if (formPanel.getFld("supplierorg").currentAttribute === "hidden") {
                    EAM.Utils.debugMessage("Entered here");
                    h[c] = "hidden";
                }
            }

        }
        EAM.Builder.setFieldState(h, formPanel.getForm().getFields());
        if (tabName != 'HDR') {
            if (formPanel.down("button[action=deleteRec]")) {
                formPanel.down("button[action=deleteRec]").setDisabled(true);
            }
            if (formPanel.down("button[action=newRec]")) {
                formPanel.down("button[action=newRec]").setDisabled(true);
            }
            if (formPanel.down("button[action=saveRec]")) {
                formPanel.down("button[action=saveRec]").setDisabled(true);
            }
            if (formPanel.down("button[action=clearRec]")) {
                formPanel.down("button[action=clearRec]").setDisabled(true);
            }
            if (Ext.ComponentQuery.query('#addeditcomments')[0]) {
                Ext.ComponentQuery.query('#addeditcomments')[0].setDisabled(true);
            }
            if (Ext.ComponentQuery.query('#viewpmactivitycomments')[0]) {
                Ext.ComponentQuery.query('#viewpmactivitycomments')[0].setDisabled(true);
            }
            if (Ext.ComponentQuery.query('#adddeferredactivity')[0]) {
                Ext.ComponentQuery.query('#adddeferredactivity')[0].setDisabled(true);
            }
            if (Ext.ComponentQuery.query('#rellocatedirectmaterial')[0]) {
                Ext.ComponentQuery.query('#rellocatedirectmaterial')[0].setDisabled(true);
            }
            if (Ext.ComponentQuery.query('#createlaborreq')[0]) {
                Ext.ComponentQuery.query('#createlaborreq')[0].setDisabled(true);
            }
            if (Ext.ComponentQuery.query('#createwarrantyclaim')[0]) {
                Ext.ComponentQuery.query('#createwarrantyclaim')[0].setDisabled(true);
            }
            if (Ext.ComponentQuery.query('#viewtaskinstructions')[0]) {
                Ext.ComponentQuery.query('#viewtaskinstructions')[0].setDisabled(true);
            }
            if (Ext.ComponentQuery.query('#adddocumotodetails')[0]) {
                Ext.ComponentQuery.query('#adddocumotodetails')[0].setDisabled(true);
            }
            if (Ext.ComponentQuery.query('#importactivities')[0]) {
                Ext.ComponentQuery.query('#importactivities')[0].setDisabled(true);
            }
            if (Ext.ComponentQuery.query('#linearlocationdetails')[0]) {
                Ext.ComponentQuery.query('#linearlocationdetails')[0].setDisabled(true);
            }
            if (Ext.ComponentQuery.query('#submit')[0]) {
                Ext.ComponentQuery.query('#submit')[0].setDisabled(true);
            }
            if (Ext.ComponentQuery.query('#clear')[0]) {
                Ext.ComponentQuery.query('#clear')[0].setDisabled(true);
            }
            if (Ext.ComponentQuery.query('#deleteactivity')[0]) {
                Ext.ComponentQuery.query('#deleteactivity')[0].setDisabled(true);
            }
            if (Ext.ComponentQuery.query('#newactivity')[0]) {
                Ext.ComponentQuery.query('#newactivity')[0].setDisabled(true);
            }
            if (Ext.ComponentQuery.query('common_comments button[action=destroy]')[0]) {
                Ext.ComponentQuery.query('common_comments button[action=destroy]')[0].setDisabled(true);
            }
            if (Ext.ComponentQuery.query('common_comments button[action=newComment]')[0]) {
                Ext.ComponentQuery.query('common_comments button[action=newComment]')[0].setDisabled(true);
            }

        }
    } else {
        EAM.Builder.setFieldState({
            'pagelayout': 'optional'
        }, a)
    }
};
function resetButtons(tabName, formPanel) {
    var a = formPanel.getForm().getFieldsAndButtons();
    if (tabName === 'ACT' || tabName === 'CLO' || tabName === 'CMT' || tabName === 'U1') {

        if (formPanel.down("button[action=deleteRec]")) {
            formPanel.down("button[action=deleteRec]").setDisabled(false);
        }
        if (formPanel.down("button[action=newRec]")) {
            formPanel.down("button[action=newRec]").setDisabled(false);
        }
        if (formPanel.down("button[action=saveRec]")) {
            formPanel.down("button[action=saveRec]").setDisabled(false);
        }
        if (formPanel.down("button[action=clearRec]")) {
            formPanel.down("button[action=clearRec]").setDisabled(false);
        }
        if (Ext.ComponentQuery.query('#addeditcomments')[0]) {
            Ext.ComponentQuery.query('#addeditcomments')[0].setDisabled(false);
        }
        if (Ext.ComponentQuery.query('#viewpmactivitycomments')[0]) {
            Ext.ComponentQuery.query('#viewpmactivitycomments')[0].setDisabled(false);
        }
        if (Ext.ComponentQuery.query('#adddeferredactivity')[0]) {
            Ext.ComponentQuery.query('#adddeferredactivity')[0].setDisabled(false);
        }
        if (Ext.ComponentQuery.query('#rellocatedirectmaterial')[0]) {
            Ext.ComponentQuery.query('#rellocatedirectmaterial')[0].setDisabled(false);
        }
        if (Ext.ComponentQuery.query('#createlaborreq')[0]) {
            Ext.ComponentQuery.query('#createlaborreq')[0].setDisabled(false);
        }
        if (Ext.ComponentQuery.query('#createwarrantyclaim')[0]) {
            Ext.ComponentQuery.query('#createwarrantyclaim')[0].setDisabled(false);
        }
        if (Ext.ComponentQuery.query('#viewtaskinstructions')[0]) {
            Ext.ComponentQuery.query('#viewtaskinstructions')[0].setDisabled(false);
        }
        if (Ext.ComponentQuery.query('#adddocumotodetails')[0]) {
            Ext.ComponentQuery.query('#adddocumotodetails')[0].setDisabled(false);
        }
        if (Ext.ComponentQuery.query('#importactivities')[0]) {
            Ext.ComponentQuery.query('#importactivities')[0].setDisabled(false);
        }
        if (Ext.ComponentQuery.query('#linearlocationdetails')[0]) {
            Ext.ComponentQuery.query('#linearlocationdetails')[0].setDisabled(false);
        }
        if (Ext.ComponentQuery.query('#submit')[0]) {
            Ext.ComponentQuery.query('#submit')[0].setDisabled(false);
        }
        if (Ext.ComponentQuery.query('#clear')[0]) {
            Ext.ComponentQuery.query('#clear')[0].setDisabled(false);
        }
        if (Ext.ComponentQuery.query('#deleteactivity')[0]) {
            Ext.ComponentQuery.query('#deleteactivity')[0].setDisabled(false);
        }
        if (Ext.ComponentQuery.query('#newactivity')[0]) {
            Ext.ComponentQuery.query('#newactivity')[0].setDisabled(false);
        }
        if (Ext.ComponentQuery.query('common_comments button[action=destroy]')[0]) {
            Ext.ComponentQuery.query('common_comments button[action=destroy]')[0].setDisabled(false);
        }
        if (Ext.ComponentQuery.query('common_comments button[action=newComment]')[0]) {
            Ext.ComponentQuery.query('common_comments button[action=newComment]')[0].setDisabled(false);
        }

    }
};

function addNewPartFieldAttribute(formPanel, vparts) {
    if (vparts === true) {
        formPanel.setFldValue("wspf_10_ou_parts", "");
        formPanel.setFldValue("wspf_10_ou_qty", "");
        formPanel.setFldValue("wspf_10_ou_curr", "");
        formPanel.setFldValue("wspf_10_ou_uoi", "");
        formPanel.setFldValue("wspf_10_ou_catprice", "");
        //formPanel.setFldValue("wspf_10_ou_date", "");

        var vFld = "";
        vFld = {

            "wspf_10_ou_parts": "protected",
            "wspf_10_ou_date": "protected",
            "wspf_10_ou_qty": "protected",
            //"wspf_10_ou_curr": "protected",
            "wspf_10_ou_uoi": "protected",
            "wspf_10_ou_catprice": "protected",
            "wspf_10_ou_date": "protected",
            "wspf_10_ou_partdesc": "optional",
            "wspf_10_ou_catalogue": "optional",
            "wspf_10_ou_partuom": "optional",
            "wspf_10_ou_partprice": "optional",
            "wspf_10_ou_partqty": "optional"
        };

        EAM.Builder.setFieldState(vFld, formPanel.getForm().getFields());
    } else {
        formPanel.setFldValue("wspf_10_ou_partdesc", "");
        formPanel.setFldValue("wspf_10_ou_catalogue", "");
        formPanel.setFldValue("wspf_10_ou_partuom", "");
        formPanel.setFldValue("wspf_10_ou_partprice", "");
        formPanel.setFldValue("wspf_10_ou_partqty", "");

        var vFld = "";
        vFld = {
            "wspf_10_ou_parts": "optional",
            "wspf_10_ou_date": "optional",
            "wspf_10_ou_qty": "optional",
            //"wspf_10_ou_curr": "optional",
            "wspf_10_ou_partdesc": "protected",
            "wspf_10_ou_catalogue": "protected",
            "wspf_10_ou_partuom": "protected",
            "wspf_10_ou_partprice": "protected",
            "wspf_10_ou_partqty": "protected"
        };
        EAM.Builder.setFieldState(vFld, formPanel.getForm().getFields());
    }
};
function setActivityStore(formPanel) {

    EAM.Utils.debugMessage("external function to set store");
    // var vActivityCode = "-";
    var vActivityCode;
    if (!Ext.isEmpty(formPanel.getFldValue("wspf_10_ou_act"))) {
        vActivityCode = formPanel.getFldValue("wspf_10_ou_act");
    } else {
        vActivityCode = "-";
    }
    try {
        var requestData = {
            GRID_NAME: "LVSUPACT",
            GRID_TYPE: "LOV",
            REQUEST_TYPE: "LOV.HEAD_DATA.STORED",
            LOV_ALIAS_NAME_1: "parameter.eventnum",
            LOV_ALIAS_VALUE_1: formPanel.getFldValue("wspf_10_ou_wo"),
            LOV_ALIAS_TYPE_1: "text",
            LOV_ALIAS_NAME_2: "parameter.language",
            LOV_ALIAS_VALUE_2: EAM.AppData.getLanguage(),
            CURRENT_TAB_NAME: userFunctionTab,
            USER_FUNCTION_NAME: userFunction,
            SYSTEM_FUNCTION_NAME: "BSUDSC",
            COMPONENT_INFO_TYPE: "DATA_ONLY"
        };

        var response = EAM.Ajax.request({
            url: "LOVPOP",
            params: requestData
        });
        var vrecords = response.responseData.pageData.grid.GRIDRESULT.GRID.DATA;
        var vdata = [];
        for (var i = 0; i < vrecords.length; i++) {
            vdata.push({
                "abbr": vrecords[i].lvsupactcode,
                "name": vrecords[i].lvsupactdesc
            });
        }

        dropDownStore = Ext.create('Ext.data.Store', {
            fields: ['abbr', 'name'],
            data: vdata
        });
        //if (vdata.length > 0 ){
        formPanel.setFldValue("myDropDown", '', true);
        myDropDown.setStore(dropDownStore);
        //}

        if (vdata.length > 0 && vActivityCode != '-') {
            myDropDown.setValue(vActivityCode);
            formPanel.setFldValue("wspf_10_ou_act", vActivityCode, true);
            var actFld = formPanel.getFld("wspf_10_ou_act");
            actFld.fireEvent('customonblur', actFld, vActivityCode);

        } else {
            //myDropDown.setValue(vdata[0].abbr);
            //formPanel.setFldValue("wspf_10_ou_act", vdata[0].abbr, true);
            //var actFld = formPanel.getFld("wspf_10_ou_act");
            //actFld.fireEvent('customonblur', actFld,vdata[0].abbr);

        }

    } catch (e) {
        EAM.Utils.debugMessage('Error in Set Store : ' + e);
    }
};
/*Function to generate a popup for type Damage or Monthly Invoice Unchecked*/
function showPopup() {
    var langmsg = "";
    var vuserLang = EAM.AppData.getInstallParams().get("language");
    if (vuserLang === "NL") {
        langmsg = "Weet je zeker dat je de status wil veranderen? Er wordt dan een automatische inkooporder gemaakt";
    } else {
        langmsg = "Are you sure you want to change the status? An automatic PO will be generated";
    }

    EAM.Messaging.showQuestion({
        msg: langmsg,
        buttons: EAM.MsgBox.YESNO,
        fn: function (g) {
            if (g === "yes") {
                //formPanel.setFldValue("workorderstatus", headerStatus, true);
                var saveButton = EAM.Utils.getMainToolbar().down("button[action=saveRec]");
                saveButton.fireEvent("click", saveButton);
                //vReturnVar = true;
            } else {
                if (g === "no") {
                    var resetButton = EAM.Utils.getMainToolbar().getResetButton();
                    resetButton.fireEvent("click", resetButton);
                    //vReturnVar = false;
                    return false;
                }
            }
        },
        scope: this
    })
};

function setPackageReturnFields(formPanel) {
    try {
        var vorg = formPanel.getFldValue("organization");
        var vfield = formPanel.getFldValue("udfchar19");
        EAM.Utils.debugMessage(vfield);
        if (!Ext.isEmpty(vfield)) {
            var requestData = {
                GRID_NAME: "LVUDFE",
                GRID_TYPE: "LOV",
                REQUEST_TYPE: "LOV.HEAD_DATA.STORED",
                LOV_ALIAS_NAME_1: "param.rentity",
                LOV_ALIAS_VALUE_1: "COMP",
                LOV_ALIAS_TYPE_1: "text",
                LOV_ALIAS_NAME_2: "param.field",
                LOV_ALIAS_VALUE_2: vfield,
                LOV_ALIAS_TYPE_2: "text",
                LOV_ALIAS_NAME_3: "param.fieldid",
                LOV_ALIAS_VALUE_3: "udfchar19",
                LOV_ALIAS_TYPE_3: "text",
                LOV_ALIAS_NAME_4: "param.associatedrentity",
                LOV_ALIAS_VALUE_4: "EVNT",
                LOV_ALIAS_TYPE_4: "text",
                LOV_ALIAS_NAME_5: "param.lookuprentity",
                LOV_ALIAS_VALUE_5: "COMP",
                LOV_ALIAS_TYPE_5: "text",
                LOV_ALIAS_NAME_6: "control.org",
                LOV_ALIAS_VALUE_6: vorg,
                LOV_ALIAS_TYPE_6: "text",
                CURRENT_TAB_NAME: "HDR",
                USER_FUNCTION_NAME: "WSJOBO",
                //SYSTEM_FUNCTION_NAME: "EWSUSR",
                COMPONENT_INFO_TYPE: "DATA_ONLY",
                'filterfields': "userdefinedfieldvalue",
                'filteroperator': "CONTAINS",
                'filtervalue': vfield
            };

            var response = EAM.Ajax.request({
                url: "LOVPOP",
                params: requestData
            });
            var records = response.responseData.pageData.grid.GRIDRESULT.GRID.DATA;

            for (var i = 0; i < records.length; i++) {
                if (records[i].userdefinedfieldvalue === vfield) {
                    vLoc1DescFld.setValue(records[i].description);
                    break;
                }
            }
        } else {
            vLoc1DescFld.setValue("");
        }
    } catch (err) {
        EAM.Utils.debugMessage('Error in setPackageReturnFields : ' + err);
    }
};

function clearPackageReturnFields() {
    try {
        vLoc1DescFld.setValue("");

    } catch (e) {
        EAM.Utils.debugMessage('Error in clearPackageReturnFields : ' + e);
    }
};

function clearFldCopyRec(formPanel) {
    try {
        EAM.Utils.debugMessage("clearFldCopyRec function called");
        formPanel.setFldValue("warranty", "", true);
        formPanel.setFldValue("trade", "", true);
        formPanel.setFldValue("esthrs", "", true);
        formPanel.setFldValue("remhrs", "", true);
        formPanel.setFldValue("pplreq", "", true);
        formPanel.setFldValue("udfchar06", "", true);
        formPanel.setFldValue("udfchar19", "", true);
        formPanel.setFldValue("udfchar22", "", true);
        formPanel.setFldValue("udfchar23", "", true);
        formPanel.setFldValue("udfchar24", "", true);
        formPanel.setFldValue("udfdate09", "", true);
        formPanel.setFldValue("udfnum09", "", true);
        formPanel.setFldValue("udfchkbox02", "", true);
        formPanel.setFldValue("schedgroup", "", true);
        formPanel.setFldValue("reportedby", "", true);
        formPanel.setFldValue("assignedto", "", true);
        vLoc1DescFld.setValue("");
        var vWarranty = getWarrantyOSOBJA(formPanel);
        formPanel.setFldValue("warranty", vWarranty, true);

    } catch (e) {
        EAM.Utils.debugMessage('Error in clearFldCopyRec : ' + e);
    }
};

function getWarrantyOSOBJA(formPanel) {
    EAM.Utils.debugMessage('getWarrantyOSOBJA called');
    var vPageData = formPanel.screen._recordview.form._record.data;
    var getBackToCorrectPageCall = EAM.Ajax.request({
        url: 'WSJOBS_HDR_VALIDATEEQUIPMENT',
        extraParams: {
            'workorderrtype': vPageData.workorderrtype,
            'equipmentclassorg': vPageData.equipmentclassorg,
            'workordernum': '<Auto-Generated>',
            'equipmentorg': vPageData.equipmentorg,
            'workorderstatus': vPageData.workorderstatus,
            'equipmentdesc': vPageData.equipmentdesc,
            'description': vPageData.description,
            'organization': vPageData.organization,
            'equipment': vPageData.equipment,
            'department': vPageData.department,
            'PKID': '<Auto-Generated>#' + vPageData.organization + '#',
            'SYSTEM_FUNCTION_NAME': 'WSJOBS',
            'USER_FUNCTION_NAME': 'WSJOBO',
            'CURRENT_TAB_NAME': 'HDR'
        }
    });
    var vWarranty = getBackToCorrectPageCall.responseData.pageData.values.warranty;
    return vWarranty;
};

/*
external function to Show Field Label
 */
function getFieldLabel(LABEL_DT, LABEL_EN) {
    var userLang = EAM.AppData.getInstallParams().get("language");
    var vLabel = "";
    if (userLang == "EN") {
        vLabel = LABEL_EN;
    } else {
        vLabel = LABEL_DT;
    }
    return vLabel
};
/*Security for N-Parts in new tab on WSJOBO*/
function getSecurityNParts(formPanel, vCatalogueReference) {
    try {
        console.log('getSecurityNParts fn called');
        // vNPartSuccess=false;
        var vNParts;
        var requestData = {
            GRID_NAME: "OUCTRF",
            GRID_TYPE: "LOV",
            REQUEST_TYPE: "LOV.HEAD_DATA.STORED",
            CURRENT_TAB_NAME: "HDR",
            USER_FUNCTION_NAME: "WSJOBO",
            SYSTEM_FUNCTION_NAME: "WSJOBO",
            COMPONENT_INFO_TYPE: "DATA_ONLY",
            LOV_ALIAS_NAME_1: "parameter.catref",
            LOV_ALIAS_VALUE_1: vCatalogueReference,
            LOV_ALIAS_TYPE_1: "text"
        };

        var response = EAM.Ajax.request({
            url: "LOVPOP",
            params: requestData
        });
        var vCatalogueReferenceDetails = response.responseData.pageData.grid.GRIDRESULT.GRID.DATA;
        if (vCatalogueReferenceDetails != undefined || vCatalogueReferenceDetails != "") {
            vNParts = vCatalogueReferenceDetails[0].catref;

        }
        console.log('vNParts is' + vNParts);
        return vNParts;
    } catch (err) {
        EAM.Utils.debugMessage('error in calling getSecurityNParts() :' + err);
    }
};
function handleVirtualActFld(formPanel) {
    try {
        console.log("handleVirtualActFld() Called!!");
        var headerStatus = formPanel.screen._listView.activeRecord.data.workorderstatus;
        if (myDropDown !== "") {
            if (headerStatus == "DI" || headerStatus == "CAL" || headerStatus == "AG" || headerStatus == "CA" || headerStatus == "TF" || headerStatus == "C") {
                console.log('headerStatus - Activity 0.1: ' + headerStatus);
                myDropDown.setReadOnly(true);
            } else {
                console.log('headerStatus - Activity 0.2: ' + headerStatus);
                myDropDown.setReadOnly(false);
            }
        }
    } catch (e) {
        console.log('handleVirtualActFld() Error: ' + e);
    }
};
function vCatPriceAttributeChanges(f) {
    try {
        console.log("vCatPriceAttributeChanges() called!!");
        var h = {};
        var vParts = f.getFldValue("wspf_10_ou_parts");
        var vPartsFld = f.getFld("wspf_10_ou_parts").currentAttribute;

        if (vParts) {
            h = {
                "wspf_10_ou_catprice": "required"
            };
        } else {
            h = {
                "wspf_10_ou_catprice": "protected"
            };
        }

        EAM.Builder.setFieldState(h, f.getForm().getFields());
    } catch (err) {
        console.log("vCatPriceAttributeChanges() Error: " + err);
    }

};
function setU1_Layout(f) {
    try {
        console.log("setU1_Layout() Called!!");
        var fPart = f.getFld('wspf_10_ou_parts'),
        vLabel = fPart.config.fieldLabel,
        vLabelWidth = fPart.config.labelWidth,
        fPartDescfPartDesc = f.getFld('wspf_10_ou_partdes');
        console.log('fPartDescfPartDesc', fPartDescfPartDesc);
        var vContainer = fPart.up('[hostCmpId=' + fPart.hostComponent + ']');

        vFieldContainerPart = Ext.create('Ext.form.FieldContainer', {
            id: 'fieldContainerPart',
            fieldLabel: vLabel,
            labelWidth: vLabelWidth,
            labelPad: 1,
            tabIndex: fPart.getTabIndex(),
            layout: 'hbox',
            style: {
                'margin-bottom': '0px'
            },
            items: [{
                    xtype: 'fieldcontainer',
                    id: 'fieldContainerPartdesc',
                    name: 'fieldContainerPartdesc',
                    fieldLabel: '',
                    layout: 'hbox',
                    style: {
                        'margin-bottom': '0px'
                    },
                    items: [fPart, fPartDescfPartDesc
                    ]
                }
            ]
        });
        fPart.setFieldLabel('');
        fPartDescfPartDesc.setFieldLabel('');
        fPartDescfPartDesc.setWidth(370);
        try {
            vContainer.insert(0, vFieldContainerPart);
        } catch (error) {
            console.log("vFieldContainerPart Inserting Error: ", error);
        }
        maintainFormPanelState(f);
    } catch (err) {
        console.log("setU1_Layout() Error: ", err);
    }
};
function partcodeDescPopulate(f) {
    try {
        console.log("partcodeDescPopulate() Called!!");
        var vPartCode = f.getFldValue("wspf_10_ou_parts");
        if (vPartCode) {
            var vPartFldDesc = f.getFld("wspf_10_ou_partdes");
            var vReqTabGrid = {
                GRID_NAME: "LVPARTSUP",
                USER_FUNCTION_NAME: "WSJOBO",
                SYSTEM_FUNCTION_NAME: "WSJOBS",
                CURRENT_TAB_NAME: "U1",
                GRID_TYPE: "LOV",
                REQUEST_TYPE: "LOV.HEAD_DATA.STORED",
                LOV_ALIAS_NAME_1: "parameter.workordernum",
                LOV_ALIAS_VALUE_1: f.getFldValue("wspf_10_ou_wo"),
                LOV_ALIAS_TYPE_1: "text",
                MADDON_FILTER_ALIAS_NAME_1: 'lvpartsupcatcode',
                MADDON_FILTER_OPERATOR_1: '=',
                MADDON_FILTER_VALUE_1: vPartCode,
                MADDON_FILTER_JOINER_1: 'AND',
                MADDON_FILTER_SEQNUM_1: '1',
            };
            var response = EAM.Ajax.request({
                url: "BSUDSC.TAB.xmlhttp",
                params: vReqTabGrid
            });

            var vSupplierDsecs;
            var vSupplierDateDetails = response.responseData.pageData.grid.GRIDRESULT.GRID.DATA;
            if (vSupplierDateDetails != undefined || vSupplierDateDetails != "") {
                vSupplierDsecs = vSupplierDateDetails[0].lvpartsupdesc;
                if (vPartFldDesc !== "") {
                    f.setFldValue("wspf_10_ou_partdes", vSupplierDsecs, true);
                }

            }
        } else {
            if (vPartFldDesc !== "") {
                f.setFldValue("wspf_10_ou_partdes", "", true);
            }
        }
        maintainFormPanelState(f);
    } catch (err) {
        console.log("partcodeDescPopulate() Error: " + err);
    }
};
function fieldStateSetNoteFld(f, pAction) {
    try {
        console.log("fieldStateSetNoteFld() called!!");
        var vStatus = f.getFldValue("workorderstatus"),
        vFld = {};
        console.log("#fieldStateSetNoteFld-Status: ", vStatus);
        /*if (pAction === "recordchnage") {
			if (vStatus === "TCS" || vStatus === "TC") {
                vFld = {
                    "udfnote02": "required"
                }
            }
		}
        else {*/
            if (vStatus === "TCS" || vStatus === "TC") {
                vFld = {
                    "udfnote02": "required"
                }
            } else {
               /* var vRequest = {
                    SYSTEM_FUNCTION_NAME: "WSJOBS",
                    USER_FUNCTION_NAME: "WSJOBO",
                    CURRENT_TAB_NAME: "HDR",
                    workordernum: f.getFldValue("workordernum"),
                    organization: f.getFldValue("organization"),
                    workorderrtype: f.getFldValue("workorderrtype"),
                    SCROLLROW: "YES",
                    ONLY_DATA_REQUIRED: true
                },
                vResponse = EAM.Ajax.request({
                    url: "WSJOBS.HDR",
                    params: vRequest,
					async:true
                });
                if (vResponse.success) {
                    console.log("vResponse: ", vResponse);
                }*/
				 vFld = {
                    "udfnote02": "protected"
                }
            }
        /*}*/
        EAM.Builder.setFieldState(vFld, f.getForm().getFields());
    } catch (err) {
        console.log("fieldStateSetNoteFld() error: ", err);
    }
}
