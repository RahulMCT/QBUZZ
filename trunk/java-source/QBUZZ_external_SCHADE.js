/*
-- -------------------------------------------------------------------------------
--
-- Copyright © 2022 by Spectades BV
--
-- Filename    : QBUZZ_external_schade.txt
--
-- Description : Extensible Framework JavaScript SCHADE - New Tab on SCHADE
-
-- Product     : EAM             Release : 12.0
--
-- Author      :MCT
--
-- CHANGE HISTORY
--
-- 0001 25-11-2022 - MCT - SCHADE - New Tab on SCHADE i.e., Additional Costs.
-- 0002 28-11-2022 - SPC-295 Override Costcode lookup and Implement line no on newly created tab.
-- 0003 02-12-2022 - SPC-295 Description of problemcode should populate on Recordview.
-- 0004 10-12-2022 - SPC-298 Equipment should come based on woNumber, Cost Code is 4405 and cost on Additional cost tab.
-- 0005 19-12-2022 - SPC-301 Comment out Costcode and Cost Value.
-- 0006 21-12-2022 - SPC-301 workorder field protected after save record.
-- 0007 23-01-2023 - comment out work order and object field protected.
-- 0008 25-01-2023 - revert back previous 0007 change(comment out work order and object field protected.)
-- 0009 21-04-2023 - fields gets protected for new status IBH.
-- 0010	19-05-2023 - SPC-342 Copy record on "damage screen" -> incident no and other fields should be clear.
-- 0011	02-06-2023 - Merged with Spectades Updocs EF
-- 0012 05-06-2023 - Handled Locale in Max Line number.
-- 0013 19-06-2023 - udhchar04 description populated.
-- 0014 17-07-2023 - SPC-369 lov override for udfchar28 & Bug fixed.
-- 0015 21-08-2023 - SPC-416 Case description set to manual value when entered
-- 0016 25-08-2023 - SPC-417 (SPC-369 udhchar04 description populated) - reverted back
-- 0017 26-06-2023 - Changed udfbutton to maintoolbar button (EAM 12 style)
-- 0018 07-11-2023 - Changed button iconcls for different EAM versions
-- 0019 07-11-2023 - Added close listener to refresh main screen
-- 0020 10-11-2023 - Bug fix: refresh could not be a function
-- 0021 13-05-2024 - Fix after EAM upgrade 12.1.1
-- -------------------------------------------------------------------------------
 */

var debug = true;
var vFunCode = "SCHADE";
var vTabName = "U1";
var vOrg = "";
var vCopyClicked = false;
var userFunctionTab = 'U1';
var userFunction = 'SCHADE';
var newRecord = false;
var vDescrip = "";
var EamVersion = '';
var gPartData = "";
//var vLoc1DescFld = "";
var vOldValue28 = "";

var docMultiOrg = true;
var eamVersion = '';

Ext.define('EAM.custom.external_schade', {
    extend: 'EAM.custom.AbstractExtensibleFramework',
    getSelectors: function () {
        var me = this;

        thisContext = this;
        return {
            '[extensibleFramework] [tabName=LST][isTabView=true]': {
                afterrender: function (f) {
                    if (f.screen.userFunction == 'SCHADE') {
                        if (!EAM.getApplication().designerMode) {
                            me.doAfterrender(f);
                        }
                    }
                }
            },

            '[extensibleFramework] [tabName=U1]': {
                afterrender: function (a, b) {
                    if (a.userFunction === vFunCode && a.tabName === vTabName) {
                        try {
                            debug && console.log('afterrender called');
                            var formPanel = this.getFormPanel();
                            setFldWidth(formPanel);

                            var headerStatus = formPanel.screen._listView.activeRecord.data.rstatus;
                            var woNumber = formPanel.screen._listView.activeRecord.data.workorder;
                            var userGroup = getUserGroup();
                            debug && console.log('headerstatus value is ' + headerStatus);
                            debug && console.log('UserGroup is ' + userGroup);

                            if (headerStatus === "C" || headerStatus === "CANC") {
                                protectAllFields(userFunctionTab, formPanel);
                                //return;
                            } else {
                                resetButtons(a.tabName, formPanel);
                                setU1DefaultValues(formPanel, "");
                            }
                            /*if (woNumber != "") {
                            formPanel.setFldValue("wspf_10_cos_costcode", "4405", true);
                            }
                            populateCostGrid(formPanel);*/

                        } catch (err) {
                            debug && console.log("#afterrender: " + err);
                        }
                    }
                },
                afterloadrecord: function (a, b, c) {
                    EAM.Utils.debugMessage("afterloadrecord function called !");
                    var formPanel = this.getFormPanel();
                    var headerStatus = formPanel.screen._listView.activeRecord.data.rstatus;

                    var userGroup = getUserGroup();

                    if (headerStatus === "C" || headerStatus === "CANC") {
                        protectAllFields(userFunctionTab, formPanel);
                        //return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                        setU1DefaultValues(formPanel, "");

                    }
                    var woNumber = formPanel.screen._listView.activeRecord.data.workorder;

                },
                afterrecordchange: function (a, b) {
                    EAM.Utils.debugMessage("afterrecordchange function called !");
                    var formPanel = this.getFormPanel();

                    var headerStatus = formPanel.screen._listView.activeRecord.data.rstatus;
                    var userGroup = getUserGroup();

                    if (headerStatus === "C" || headerStatus === "CANC") {
                        protectAllFields(userFunctionTab, formPanel);
                        //return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                        setU1DefaultValues(formPanel, "");

                    }

                    /*var woNumber = formPanel.screen._listView.activeRecord.data.workorder;
                    if (woNumber != "") {
                    formPanel.setFldValue("wspf_10_cos_costcode", "4405", true);
                    }
                    populateCostGrid(formPanel);*/

                },
                afternewrecord: function (a) {
                    EAM.Utils.debugMessage("afterrender function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();

                    var headerStatus = formPanel.screen._listView.activeRecord.data.rstatus;
                    var userGroup = getUserGroup();

                    if (headerStatus === "C" || headerStatus === "CANC") {
                        protectAllFields(userFunctionTab, formPanel);
                        //return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                        setU1DefaultValues(formPanel, "");

                    }
                    var woNumber = formPanel.screen._listView.activeRecord.data.workorder;
                    /*if (woNumber != "") {
                    formPanel.setFldValue("wspf_10_cos_costcode", "4405", true);
                    }
                    populateCostGrid(formPanel);*/

                },
                afterreset: function (a) {
                    EAM.Utils.debugMessage("afterrender function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();

                    var headerStatus = formPanel.screen._listView.activeRecord.data.rstatus;
                    var userGroup = getUserGroup();

                    if (headerStatus === "C" || headerStatus === "CANC") {
                        protectAllFields(userFunctionTab, formPanel);
                        //return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                        setU1DefaultValues(formPanel, "");

                    }
                    var woNumber = formPanel.screen._listView.activeRecord.data.workorder;
                    /*if (woNumber != "") {
                    formPanel.setFldValue("wspf_10_cos_costcode", "4405", true);
                    }
                    populateCostGrid(formPanel);/*

                    },
                    aftersaverecord: function (a, b, c) {
                    EAM.Utils.debugMessage("aftersaverecord function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();

                    var headerStatus = formPanel.screen._listView.activeRecord.data.rstatus;
                    var userGroup = getUserGroup();

                    if (headerStatus === "C" || headerStatus === "CANC") {
                    protectAllFields(userFunctionTab, formPanel);
                    //return;
                    } else {
                    resetButtons(a.tabName, formPanel);
                    setU1DefaultValues(formPanel, "");

                    }
                    var woNumber = formPanel.screen._listView.activeRecord.data.workorder;
                    /*if (woNumber != "") {
                    formPanel.setFldValue("wspf_10_cos_costcode", "4405", true);
                    }
                    populateCostGrid(formPanel);*/

                },
                afterdestroyrecord: function (a, b, c) {
                    EAM.Utils.debugMessage("aftersaverecord function called !");
                    var formPanel = this.getFormPanel();
                    var formPanel = this.getFormPanel();

                    var headerStatus = formPanel.screen._listView.activeRecord.data.rstatus;
                    var userGroup = getUserGroup();

                    if (headerStatus === "C" || headerStatus === "CANC") {
                        protectAllFields(userFunctionTab, formPanel);
                        //return;
                    } else {
                        resetButtons(a.tabName, formPanel);
                        setU1DefaultValues(formPanel, "");

                    }
                    var woNumber = formPanel.screen._listView.activeRecord.data.workorder;
                    /*if (woNumber != "") {
                    formPanel.setFldValue("wspf_10_cos_costcode", "4405", true);
                    }
                    populateCostGrid(formPanel);*/

                },
                before_eam_beforesaverecord: function (a, b, c) {
                    if (a.userFunction === vFunCode && a.tabName === vTabName) {
                        EAM.Utils.debugMessage("before_eam_beforesaverecord function called !");
                        var formPanel = this.getFormPanel();
                        setLineNo(formPanel);
                    }
                }

            },
            '[extensibleFramework] uxtabpanel[itemId=tabContent]': {
                aftertabchange: function (field, event) {

                    var formPanel = this.getFormPanel();
                    EAM.Utils.debugMessage("tabchange event called !");
                    var vEquip = formPanel.getFldValue("equipment");
                    if (vEquip != "") {
                        h = {
                            "equipment": "protected"
                        };
                        EAM.Builder.setFieldState(h, formPanel.getForm().getFields());
                    }

                }
            },
            '[extensibleFramework] [tabName=HDR]': {
                afterrecordchange: function (a, b) {

                    try {

                        debug && console.log('afterrecordchange called');
                        var formPanel = this.getFormPanel();

                        vOrg = formPanel.getFldValue("organization");
                        debug && console.log('organization value is ' + vOrg);
                        var vDescription = formPanel.getFldValue("casedescription");
                        vOldValue28 = formPanel.getFldValue("udfchar28");
                        protectHdrField(formPanel, "");
                        callGridudfchar28(formPanel);
                        if (vCopyClicked == true) {
                            clearFldCopyRec(formPanel);
                            //formPanel.setFldValue("workorder", "", true);
                        }
                        vCopyClicked = false;
                        if (vDescription == "") {
                            formPanel.setFldValue("casedescription", "SCHADEDOSSIER", true);
                        }
                        var vEquip = formPanel.getFldValue("equipment");
                        if (vEquip != "") {
                            h = {
                                "equipment": "protected"
                            };
                            EAM.Builder.setFieldState(h, formPanel.getForm().getFields());
                        }
                        //callGrid(formPanel);
                        me.hdr_afterRecordChange(formPanel);

                    } catch (err) {
                        debug && console.log("#after recordchange: " + err);
                    }

                },
                before_eam_beforesaverecord: function (a, b, c) {
                    try {

                        EAM.Utils.debugMessage("beforesaverecord function called !");
                        var formPanel = this.getFormPanel();

                    } catch (e) {
                        EAM.Utils.debugMessage('Error in beforesaverecord : ' + e);
                    }
                },
                aftersaverecord: function (a, b) {

                    try {

                        debug && console.log('aftersaverecord called');
                        var formPanel = this.getFormPanel();
                        var vEquip = formPanel.getFldValue("equipment");
                        protectHdrField(formPanel, "");
                        // callGridudfchar28(formPanel);
                        if (vEquip != "") {
                            h = {
                                "equipment": "protected"
                            };
                            EAM.Builder.setFieldState(h, formPanel.getForm().getFields());
                        }

                        me.hdr_afterRecordChange(formPanel);

                    } catch (err) {
                        debug && console.log("aftersaverecord: " + err);
                    }

                },
                afternewrecord: function (a, b) {
                    debug && console.log("after new record clicked");
                    var formPanel = this.getFormPanel();
                    newRecord = true;
                    // callGridudfchar28(formPanel);
                    me.hdr_afterRecordChange(a);

                },
                afterrender: function (a, b) {
                    debug && console.log("afterrender fn called");
                    var formPanel = this.getFormPanel();
                    newRecord = true;
                    protectHdrField(formPanel, "");

                    /* var vLoc1 = formPanel.getFld("udfchar04");
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
                    EAM.Utils.debugMessage("TextFields Is created :"); */

                    // REV 0019
                    if (!EAM.getApplication().designerMode) {
                        me.doAfterrender(a);
                    }

                    /* add button, no udfbuttons present
                     *  button will be placed below Status
                     */
                    // var formPanel = this.getFormPanel();
                    var vStatusField = formPanel.getFld('status');

                    var vStatusContainer = vStatusField.up('container');
                    var vItemsCount = vStatusContainer.items.length;
                    var btnIndex = vItemsCount + 1;

                    me.hdr_afterRecordChange(formPanel);

                },
                afterreset: function (a, b) {
                    debug && console.log("afterreset fn called");
                    var formPanel = this.getFormPanel();
                    protectHdrField(formPanel, "");
                    //callGridudfchar28(formPanel);
                }

            },
            '[extensibleFramework] [tabName=HDR] lovfield[name=udfchar28]': {
                beforetriggerclick: function (field, event) {
                    try {
                        var formPanel = this.getFormPanel();
                        debug && console.log("beforetriggerclick of udfchar28 called !");
                        overrideProblemcode(formPanel, field);
                    } catch (err) {
                        debug && console.log("Error in udfchar28 lovfield " + err);
                    }
                },
                customonblur: function (a, b, c, d) {
                    try {
                        var formPanel = this.getFormPanel();
                        EAM.Utils.debugMessage("customonblur udfchar28 fn called !");

                        callGridudfchar28(formPanel);
                        var newValue = a.lastValidatedValue;
                        var oldValue = b.udfchar28;
                        EAM.Utils.debugMessage(newValue + "  " + oldValue);
                        if (newValue.startsWith("2AD")) {
                            formPanel.setFldValue("udfchar04", "25 - Bij aanvang dienst");
                            //callGrid(formPanel);
                            formPanel.setFldValue("udfchar11", "NVT");
                            formPanel.setFldValue("udfchar20", "Intern/niet verzekerd");
                            formPanel.setFldValue("udfchar21", "Qbuzz");
                            formPanel.setFldValue("udfchar22", "Nee");
                        } else {
                            if (oldValue.startsWith("2AD")) {
                                formPanel.setFldValue("udfchar04", "");
                                vLoc1DescFld.setValue("");
                                formPanel.setFldValue("udfchar11", "");
                                formPanel.setFldValue("udfchar20", "");
                                formPanel.setFldValue("udfchar21", "");
                                formPanel.setFldValue("udfchar22", "");
                            }
                        }
                    } catch (err) {
                        EAM.Utils.debugMessage("Error in udfchar28 customonblur " + err);
                    }
                },
                blur: function (a, b, c, d) {
                    try {
                        var formPanel = this.getFormPanel();
                        EAM.Utils.debugMessage("blur udfchar28 fn called !");

                        callGridudfchar28(formPanel);
                        var newValue = formPanel.getFldValue("udfchar28"); ;
                        //var oldValue= a.value;
                        var oldValue = vOldValue28;

                        EAM.Utils.debugMessage(newValue + "  " + oldValue);
                        if (newValue.startsWith("2AD")) {
                            formPanel.setFldValue("udfchar04", "25 - Bij aanvang dienst");
                            //callGrid(formPanel);
                            formPanel.setFldValue("udfchar11", "NVT");
                            formPanel.setFldValue("udfchar20", "Intern/niet verzekerd");
                            formPanel.setFldValue("udfchar21", "Qbuzz");
                            formPanel.setFldValue("udfchar22", "Nee");
                        } else {
                            if (oldValue.startsWith("2AD")) {
                                formPanel.setFldValue("udfchar04", "");
                                vLoc1DescFld.setValue("");
                                formPanel.setFldValue("udfchar11", "");
                                formPanel.setFldValue("udfchar20", "");
                                formPanel.setFldValue("udfchar21", "");
                                formPanel.setFldValue("udfchar22", "");
                            }
                        }
                    } catch (err) {
                        EAM.Utils.debugMessage("Error in udfchar28 blur " + err);
                    }
                },
            },

            '[extensibleFramework] [tabName=U1] lovfield[name=wspf_10_cos_costcode]': {
                beforetriggerclick: function (field, event) {
                    try {
                        var formPanel = this.getFormPanel();
                        EAM.Utils.debugMessage("beforetriggerclick of wspf_10_cos_costcode called !");
                        overridelovfield(formPanel, field);
                    } catch (err) {
                        EAM.Utils.debugMessage("Error in costcode lovfield " + err);
                    }
                },
                customonblur: function (field) {
                    try {
                        var formPanel = this.getFormPanel();

                        EAM.Utils.debugMessage("customonblur fn called !");
                        var vCostCode = formPanel.getFldValue("wspf_10_cos_costcode");
                        gridCallCostCode(formPanel, vCostCode);
                        if (vCostCode === "") {
                            formPanel.setFldValue("wspf_10_cos_costcode", "", true);
                            formPanel.setFldValue("wspf_10_cos_costcodedesc", "", true);
                        }

                    } catch (err) {
                        EAM.Utils.debugMessage("Error in problemcode customonblur " + err);
                    }

                }

            },
            '[extensibleFramework] [tabName=HDR] lovfield[name=problemcode]': {
                beforetriggerclick: function (field, event) {
                    try {
                        var formPanel = this.getFormPanel();
                        EAM.Utils.debugMessage("beforetriggerclick of problemcode called !");
                        overrideProblemlovfield(formPanel, field);

                    } catch (err) {
                        EAM.Utils.debugMessage("Error in problemcode lovfield " + err);
                    }
                },
                customonblur: function (field) {
                    try {
                        var formPanel = this.getFormPanel();

                        EAM.Utils.debugMessage("customonblur fn called !");
                        var vProblemCode = formPanel.getFldValue("problemcode");
                        EAM.Utils.debugMessage("problem code value is " + vProblemCode);
                        if (vProblemCode === "") {
                            formPanel.setFldValue("casedescription", "SCHADEDOSSIER", true);
                        } else {

                            setReturnFields(formPanel, field);
                        }

                    } catch (err) {
                        EAM.Utils.debugMessage("Error in problemcode customonblur " + err);
                    }

                }
            },
            '[extensibleFramework] [tabName=HDR] lovfield[name=organization]': {
                customonblur: function (field) {
                    try {
                        var formPanel = this.getFormPanel();

                        EAM.Utils.debugMessage("customonblur fn called !");
                        var vProblemCode = formPanel.getFldValue("problemcode");
                        EAM.Utils.debugMessage("problem code value is " + vProblemCode);
                        if (vProblemCode === "") {
                            formPanel.setFldValue("casedescription", "SCHADEDOSSIER", true);
                        }
                        /*else {
                        newRecord=true;
                        overridelovfield(formPanel, field);
                        }*/

                    } catch (err) {
                        EAM.Utils.debugMessage("Error in problemcode customonblur " + err);
                    }

                }
            },
            '[extensibleFramework] [tabName=HDR] lovfield[name=udfchar04]': {
                customonblur: function (field) {
                    try {
                        var formPanel = this.getFormPanel();
                        EAM.Utils.debugMessage("customonblur fn called !");
                        //callGrid(formPanel);

                    } catch (err) {
                        EAM.Utils.debugMessage("Error in udfchar04 customonblur " + err);
                    }

                }
            },
            '[extensibleFramework] [tabName=HDR] lovfield[name=workorder]': {
                beforetriggerclick: function (field, event) {
                    try {
                        var formPanel = this.getFormPanel();
                        EAM.Utils.debugMessage("beforetriggerclick of workorder called !");
                        overridelovfield(formPanel, "workorder");

                        h = {
                            "equipment": "protected"
                        };
                        EAM.Builder.setFieldState(h, formPanel.getForm().getFields());

                    } catch (err) {
                        EAM.Utils.debugMessage("Error in beforetriggerclick workorder" + err);
                    }
                },
                customonblur: function (field) {
                    try {
                        var formPanel = this.getFormPanel();

                        EAM.Utils.debugMessage("customonblur fn called !");
                        var vWorkOrder = formPanel.getFldValue("workorder");
                        var vEquipOrg = formPanel.getFldValue("equipmentorg");
                        EAM.Utils.debugMessage("EquipOrg value is " + vEquipOrg);
                        if (vWorkOrder != "" || vWorkOrder != null)
                            gridCall(formPanel, vWorkOrder);
                        if (vWorkOrder === "") {
                            formPanel.setFldValue("equipment", "", true);
                            formPanel.setFldValue("equipmentdesc", "", true);
                            formPanel.setFldValue("udfchar03", "", true);
                            h = {
                                "equipment": "optional"
                            };
                            EAM.Builder.setFieldState(h, formPanel.getForm().getFields());
                        } else {
                            h = {
                                "equipment": "protected"
                            };
                            EAM.Builder.setFieldState(h, formPanel.getForm().getFields());
                        }
                    } catch (err) {
                        EAM.Utils.debugMessage("Error in workorder customonblur " + err);
                    }

                }
            },
            '[extensibleFramework] [tabName=HDR] uxcombobox[name=status]': {
                select: function (a, newStatus, oldStatus) {

                    EAM.Utils.debugMessage("status change function called !");
                    var formPanel = this.getFormPanel();
                    protectHdrField(formPanel, "");

                    var vEquip = formPanel.getFldValue("equipment");
                    EAM.Utils.debugMessage("Equipment value is" + vEquip);
                    if (vEquip != "") {
                        var h = {
                            'equipment': "protected",

                        };
                        EAM.Builder.setFieldState(h, formPanel.getForm().getFields());
                    }
                }
            },
            '[extensibleFramework] maintoolbar button[action=copyRec]': {
                click: function (a, b, c) {
                    try {
                        EAM.Utils.debugMessage('copy record button clicked');
                        var formPanel = this.getFormPanel();
                        clearFldCopyRec(formPanel);
                        //formPanel.setFldValue("workorder", "", true);
                        vCopyClicked = true;
                    } catch (err) {
                        EAM.Utils.debugMessage("copy record button click err :" + err);
                    }
                }
            },
        }
    },

    doAfterrender: function (f) {
        var me = this;

        var script = document.createElement("script");
        script.src = "https://files.spectades.com/plupload/plupload.full.min.js";

        document.head.appendChild(script);

        EAM.Ajax.request({
            url: 'about',
            params: {
                'SYSTEM_FUNCTION_NAME': 'about',
                'USER_FUNCTION_NAME': 'about',
                'popup': true,
                'usagetype': 'popup'
            },
            onSuccess: function (success, request, response) {
                eamVersion = response.pageData.rows[3].value;

                console.log('eamVersion: ', eamVersion);

                me.defineUploadPopup();

                me.createButton(f);
            },
            callbackScope: this,
            async: true
        });

        // call BSIMPT.BDU screen to initialize
        EAM.Ajax.request({
            url: 'BSIMPT.BDU',
            params: {
                'SYSTEM_FUNCTION_NAME': 'BSIMPT',
                'USER_FUNCTION_NAME': 'BSIMPT',
                'CURRENT_TAB_NAME': 'BDU',
                'customfieldcode': '',
                'sessionid': ''
            },
            onSuccess: function (success, request, response) {},
            callbackScope: this,
            async: true
        });
    },

    defineUploadPopup: function () {
        /* Define Upload panel */
        Ext.define('Ext.ux.panel.UploadPanel', {
            extend: 'Ext.grid.Panel',
            alias: 'widget.uploadpanel',

            itemId: "uploadpanel",

            // configuration
            title: 'Documenten uploaden/koppelen',
            url: '',
            //chunk_size: '1mb', // don't set, not EAM compatible

            filters: {
                /* mime_types : [{ title : "Image files", extensions : "jpg,gif,png" },{ title : "Zip files", extensions : "zip" }
                ], */// let EAM handle this
                max_file_size: '50mb', // EAM default in CloudSuite
                prevent_duplicates: true
            },
            unique_names: false,
            multipart: true,
            file_data_name: 'filename', // EAM specific
            pluploadPath: 'public/js/plupload',
            pluploadRuntimes: 'html5,html4', // 'html5,gears,browserplus,silverlight,flash,html4',

            texts: {
                status: ['In wachtrij', 'Uploaden', 'Onbekend', 'Fout', 'Gereed'],
                dragDropAvailable: 'Voeg documenten toe via de knop "Documenten toevoegen" of sleep hier uw documenten naar toe',
                noDragDropAvailable: 'Deze browser biedt geen ondersteuning voor drag & drop.',
                emptyTextTpl: '<div style="color:#808080; margin:20px auto; text-align:center; top:48%; position:relative;">{0}</div>',
                cols: ['Document', 'Grootte', 'Status', 'Bericht'],
                addButtonText: 'Documenten toevoegen',
                uploadButtonText: 'Uploaden',
                cancelButtonText: 'Annuleren',
                deleteButtonText: 'Weghalen',
                deleteUploadedText: 'Gereed',
                deleteAllText: 'Alle',
                deleteSelectedText: 'Selectie',
                deleteErrorText: 'Fout',
                progressCurrentFile: 'Huidige document:',
                progressTotal: 'Totaal:',
                statusInvalidSizeText: 'Bestand is te groot (max. 5MB)',
                statusInvalidExtensionText: 'Bestandstype niet toegestaan',
                statusDuplicateText: 'Bestand reeds in de wachtrij'
            },

            // internal do not change

            // grid view
            multiSelect: true,
            viewConfig: {
                // for showing emptyText
                deferEmptyText: false
            },

            // hack: loaded of the actual file (plupload is sometimes a step ahead)
            loadedFile: 0,

            listeners: {
                beforestart: function (uploadpanel) {
                    var e = this;

                    this.store.each(function (record) {
                        if (record.data.status == 1) {

                            var i = {
                                'description': '',
                                'documentcode': '',
                                'exceptionsequence': '5',
                                'fileexists': '',
                                'filename': record.get('name'),
                                // documents single or multi org
                                'multiorg': docMultiOrg,
                                'organization': docMultiOrg ? uploadpanel.EAMParams['organization'] : '*',
                                'pagemode': 'display',
                                'typecode': 'U',
                                'uploaddoc': 'U',
                                'uploadorcreatedoc': 'U',
                                'SYSTEM_FUNCTION_NAME': 'BSIMPT',
                                'USER_FUNCTION_NAME': 'BSIMPT',
                                'CURRENT_TAB_NAME': 'BDU',
                                'RESET_CURSOR': false
                            };

                            EAM.Ajax.request({
                                url: "BSIMPT.BDU.checkfile",
                                params: i,
                                onSuccess: function (success, request, response) {
                                    if (response.pageData.success === false) {
                                        var data = {
                                            code: '-700',
                                            message: 'File extension error.',
                                            file: record.data
                                        };

                                        data.file.status = 4;
                                        data.file.msg = Ext.String.format('<span style="color: red">{0}</span>', this.texts.statusInvalidExtensionText);

                                        this.getTopToolbar().getComponent('delete').setDisabled(false);
                                        this.updateStoreFile(data.file);
                                        this.updateProgress();

                                    } else {
                                        var p = response.pageData.values;

                                        record.set({
                                            organization: p.organization,
                                            description: p.description,
                                            documentcode: p.documentcode,
                                            fileexists: '' // p.fileexists,
                                        });

                                        var q = Ext.clone(uploadpanel.uploader.settings.baseParams || {});

                                        Ext.apply(q, {
                                            'organization': p.organization,
                                            'description': p.description || '',
                                            'documentcode': p.documentcode || '',
                                            'fileexists': '', // p.fileexists,
                                            'reservedfilename': '' // EAM 11.5
                                        });

                                        uploadpanel.uploader.setOption("multipart_params", q);
                                    }

                                },
                                callbackScope: e,
                                async: false,
                                messagingOptions: {
                                    deferError: true
                                },
                                disableMask: true
                            });
                        }

                    }, this);

                },
                uploadstarted: function (uploadpanel) {},
                uploadcomplete: function (uploadpanel, success, failures) {}
            },

            constructor: function (config) {

                // list of files
                this.success = [];
                this.failed = [];

                this.baseParams = {
                    'exceptionsequence': '5',
                    'multiorg': docMultiOrg,
                    'pagemode': 'display',
                    'typecode': 'U',
                    'uploaddoc': 'U',
                    'uploadorcreatedoc': 'U',
                    'SYSTEM_FUNCTION_NAME': 'BSIMPT',
                    'USER_FUNCTION_NAME': 'BSIMPT',
                    'CURRENT_TAB_NAME': 'BDU'
                },

                // column header
                config.columns = [{
                        header: this.texts.cols[0],
                        flex: 2,
                        dataIndex: 'name'
                    }, {
                        header: this.texts.cols[1],
                        flex: 1,
                        dataIndex: 'size',
                        renderer: Ext.util.Format.fileSize
                    }, {
                        header: this.texts.cols[2],
                        flex: 1,
                        dataIndex: 'status',
                        renderer: this.renderStatus
                    }, {
                        header: this.texts.cols[3],
                        flex: 2,
                        dataIndex: 'msg'
                    }
                ];

                // model and store
                //if(!Ext.ModelManager.getModel('Plupload')) {
                Ext.define('Plupload', {
                    extend: 'Ext.data.Model',
                    fields: ['id', 'name', 'size', 'percent', 'status', 'type', 'msg', 'loaded', 'organization', 'description', 'documentcode', 'fileexists', 'reservedfilename']
                });
                //}

                config.store = {
                    type: 'json',
                    model: 'Plupload',
                    listeners: {
                        load: this.onStoreLoad,
                        remove: this.onStoreRemove,
                        update: this.onStoreUpdate,
                        scope: this
                    },
                    proxy: 'memory'
                };

                this.tbar = {
                    enableOverflow: true,
                    items: [
                        new Ext.Button({
                            text: this.texts.addButtonText,
                            itemId: 'addButton',
                            //iconCls: config.addButtonCls || 'pluploadAddCls',
                            disabled: true,
                            ui: 'default',
                            style: 'background-color: #FFA500 !important; color: #FFF;'
                        }), {
                            xtype: 'tbspacer',
                            width: 20
                        },
                        new Ext.Button({
                            text: this.texts.uploadButtonText,
                            handler: this.onStart,
                            scope: this,
                            disabled: true,
                            itemId: 'upload',
                            ui: 'buttondefault',
                            //iconCls: config.uploadButtonCls || 'pluploadUploadCls'
                        }),
                        new Ext.Button({
                            text: this.texts.cancelButtonText,
                            handler: this.onCancel,
                            scope: this,
                            disabled: true,
                            itemId: 'cancel',
                            ui: 'default',
                            //iconCls: config.cancelButtonCls || 'pluploadCancelCls'
                        }),
                        new Ext.SplitButton({
                            text: this.texts.deleteButtonText,
                            handler: this.onDeleteSelected,
                            menu: new Ext.menu.Menu({
                                items: [{
                                        text: this.texts.deleteUploadedText,
                                        handler: this.onDeleteUploaded,
                                        scope: this
                                    },
                                    '-', {
                                        text: this.texts.deleteErrorText,
                                        handler: this.onDeleteError,
                                        scope: this
                                    },
                                    '-', {
                                        text: this.texts.deleteSelectedText,
                                        handler: this.onDeleteSelected,
                                        scope: this
                                    },
                                    '-', {
                                        text: this.texts.deleteAllText,
                                        handler: this.onDeleteAll,
                                        scope: this
                                    }

                                ]
                            }),
                            scope: this,
                            disabled: true,
                            itemId: 'delete',
                            ui: 'default',
                            //iconCls: config.deleteButtonCls || 'pluploadDeleteCls'
                        })
                    ]
                };

                // bottom progress bar
                this.progressBarSingle = new Ext.ProgressBar({
                    flex: 1,
                    animate: true
                });
                this.progressBarAll = new Ext.ProgressBar({
                    flex: 2,
                    animate: true
                });

                this.bbar = {
                    layout: 'hbox',
                    style: {
                        paddingLeft: '5px'
                    },
                    items: [
                        this.texts.progressCurrentFile,
                        this.progressBarSingle, {
                            xtype: 'tbtext',
                            itemId: 'single',
                            style: 'text-align:right',
                            text: '',
                            width: 150
                        },
                        this.texts.progressTotal,
                        this.progressBarAll, {
                            xtype: 'tbtext',
                            itemId: 'all',
                            style: 'text-align:right',
                            text: '',
                            width: 150
                        }, {
                            xtype: 'tbtext',
                            itemId: 'speed',
                            style: 'text-align:right',
                            text: '',
                            width: 150
                        }, {
                            xtype: 'tbtext',
                            itemId: 'remaining',
                            style: 'text-align:right',
                            text: '',
                            width: 150
                        }
                    ]
                };

                this.callParent(arguments);
            },
            afterRender: function () {
                this.callParent(arguments);
                this.initPlupload();
            },
            renderStatus: function (value, meta, record, rowIndex, colIndex, store, view) {
                var s = this.texts.status[value - 1];
                if (value == 2) {
                    s += ' ' + record.get('percent') + ' %';
                }
                return s;
            },
            getTopToolbar: function () {
                var bars = this.getDockedItems('toolbar[dock="top"]');
                return bars[0];
            },
            getBottomToolbar: function () {
                var bars = this.getDockedItems('toolbar[dock="bottom"]');
                return bars[0];
            },
            initPlupload: function () {
                this.uploader = new plupload.Uploader({
                    url: this.url,
                    runtimes: this.pluploadRuntimes,
                    browse_button: this.getTopToolbar().getComponent('addButton').getEl().dom.id,
                    container: this.getEl().dom.id,
                    max_file_size: this.max_file_size || '',
                    resize: this.resize || '',
                    //flash_swf_url: this.pluploadPath + '/plupload.flash.swf', //needed?
                    //silverlight_xap_url: this.pluploadPath + 'plupload.silverlight.xap', //needed?
                    filters: this.filters || [],
                    //chunk_size: this.chunk_size,
                    unique_names: this.unique_names,
                    multipart: this.multipart,
                    multipart_params: this.multipart_params || null,
                    drop_element: this.getEl().dom.id,
                    required_features: this.required_features || null,
                    file_data_name: this.file_data_name || 'filename', // EAM specific
                    baseParams: this.baseParams || null,
                    EAMParams: this.EAMParams || null

                });

                // events
                Ext.each(['Init', 'ChunkUploaded', 'FilesAdded', 'FilesRemoved', 'FileUploaded', 'PostInit', 'QueueChanged', 'Refresh', 'StateChanged', 'UploadFile', 'UploadProgress', 'Error'], function (v) {
                    this.uploader.bind(v, eval('this.Plupload' + v), this);
                }, this);

                // init Plupload
                this.uploader.init();
            },
            onDeleteSelected: function () {
                if (this.getView().getSelectionModel().hasSelection()) {
                    Ext.each(this.getView().getSelectionModel().getSelection(), function (record) {
                        this.remove_file(record.get('id'));
                    }, this);
                } else {
                    EAM.Msg.showError('Geen records geselecteerd.');
                }
            },
            onDeleteAll: function () {
                this.store.each(function (record) {
                    this.remove_file(record.get('id'));
                }, this);
            },
            onDeleteUploaded: function () {
                this.store.each(function (record) {
                    if (record.get('status') == 5) {
                        this.remove_file(record.get('id'));
                    }
                }, this);
            },
            onDeleteError: function () {
                this.store.each(function (record) {
                    if (record.get('status') == 4) {
                        this.remove_file(record.get('id'));
                    }
                }, this);
            },
            onCancel: function () {
                this.uploader.stop();
                this.updateProgress();
            },
            onStart: function () {
                this.fireEvent('beforestart', this);

                if (this.multipart_params) {
                    this.uploader.settings.multipart_params = this.multipart_params;
                }
                this.uploader.start();
            },
            remove_file: function (id) {
                var fileObj = this.uploader.getFile(id);
                if (fileObj) {
                    this.uploader.removeFile(fileObj);
                } else {
                    this.store.remove(this.store.getById(id));
                }
            },
            updateStore: function (files) {
                Ext.each(files, function (data) {
                    this.updateStoreFile(data);
                }, this);
            },
            updateStoreFile: function (data) {
                data.msg = data.msg || '';
                var record = this.store.getById(data.id);
                if (record) {
                    record.set(data);
                    record.commit();
                } else {
                    this.store.add(data);
                }
            },
            onStoreLoad: function (store, record, operation) {},
            onStoreRemove: function (store, record, operation) {
                if (!store.data.length || store.data.length == 0) {
                    this.getTopToolbar().getComponent('delete').setDisabled(true);
                    this.getTopToolbar().getComponent('upload').setDisabled(true);
                    this.uploader.total.reset();
                }

                var id = record[0].get('id');

                Ext.each(this.success, function (v) {
                    if (v && v.id == id) {
                        Ext.Array.remove(this.success, v);
                    }
                }, this);

                Ext.each(this.failed, function (v) {
                    if (v && v.id == id) {
                        Ext.Array.remove(this.failed, v);
                    }
                }, this);
            },
            onStoreUpdate: function (store, record, operation) {
                var canUpload = false;
                if (this.uploader.state != 2) {
                    this.store.each(function (record) {
                        if (record.get('status') == 1) {
                            canUpload = true;
                            return false;
                        }
                    }, this);
                }
                this.getTopToolbar().getComponent('upload').setDisabled(!canUpload);
            },
            updateProgress: function (file) {
                var queueProgress = this.uploader.total;

                // all
                var total = queueProgress.size;
                var uploaded = queueProgress.loaded;
                this.getBottomToolbar().getComponent('all').setText(Ext.util.Format.fileSize(uploaded) + '/' + Ext.util.Format.fileSize(total));

                if (total > 0) {
                    this.progressBarAll.updateProgress(queueProgress.percent / 100, queueProgress.percent + ' %');
                } else {
                    this.progressBarAll.updateProgress(0, ' ');
                }

                // speed plus remaining
                var speed = queueProgress.bytesPerSec;
                if (speed > 0) {
                    var totalSec = parseInt((total - uploaded) / speed);
                    var hours = parseInt(totalSec / 3600) % 24;
                    var minutes = parseInt(totalSec / 60) % 60;
                    var seconds = totalSec % 60;
                    var timeRemaining = result = (hours < 10 ? '0' + hours : hours) + ':' + (minutes < 10 ? '0' + minutes : minutes) + ':' + (seconds < 10 ? '0' + seconds : seconds);
                    this.getBottomToolbar().getComponent('speed').setText(Ext.util.Format.fileSize(speed) + '/s');
                    this.getBottomToolbar().getComponent('remaining').setText(timeRemaining);
                } else {
                    this.getBottomToolbar().getComponent('speed').setText('');
                    this.getBottomToolbar().getComponent('remaining').setText('');
                }

                // single
                if (!file) {
                    this.getBottomToolbar().getComponent('single').setText('');
                    this.progressBarSingle.updateProgress(0, ' ');
                } else {
                    total = file.size;

                    // we use this Hack to store the value which is one step back
                    uploaded = this.loadedFile;

                    this.getBottomToolbar().getComponent('single').setText(Ext.util.Format.fileSize(uploaded) + '/' + Ext.util.Format.fileSize(total));
                    this.progressBarSingle.updateProgress(file.percent / 100, (file.percent).toFixed(0) + ' %');
                }
            },
            PluploadInit: function (uploader, data) {
                this.getTopToolbar().getComponent('addButton').setDisabled(false);
                if (data.runtime == 'flash' || data.runtime == 'silverlight' || data.runtime == 'html4') {
                    this.view.emptyText = this.texts.noDragDropAvailable;
                } else {
                    this.view.emptyText = this.texts.dragDropAvailable
                }
                this.view.emptyText = Ext.String.format(this.texts.emptyTextTpl, this.view.emptyText);
                this.view.refresh();

                this.updateProgress();
            },
            PluploadChunkUploaded: function () {},
            PluploadFilesAdded: function (uploader, files) {
                this.getTopToolbar().getComponent('delete').setDisabled(false);
                this.updateStore(files);
                this.updateProgress();
            },
            PluploadFilesRemoved: function (uploader, files) {
                Ext.each(files, function (file) {
                    this.store.remove(this.store.getById(file.id));
                }, this);

                this.updateProgress();
            },
            PluploadFileUploaded: function (uploader, file, status) {
                var response = Ext.JSON.decode(status.response);

                if (response.success === true) {
                    file.server_error = 0;

                    // add documentcode to file
                    var vMatches = (response.messages[0].msg).match(/(\d+)/);

                    if (vMatches) {
                        file.documentcode = vMatches[0];
                        file.msg = response.messages[0].msg || null;
                    }

                    // get unique file path
                    var vFilepath = response.pageData.values.filepath;

                    file.name = vFilepath;

                    // go link uploaded document to entity
                    this.linkDocument(uploader, file);

                    this.success.push(file);

                } else {
                    console.log('something went wrong');

                    if (response.messages.length > 0) {
                        file.msg = '<span style="color: red">' + response.messages[0].msg + '</span>';
                    }

                    if (response.message) {
                        file.msg = '<span style="color: red">' + response.message + '</span>';
                    }

                    file.server_error = 1;
                    file.status = 4;
                    this.failed.push(file);
                }

                this.updateStoreFile(file);
                this.updateProgress(file);
            },
            PluploadPostInit: function () {},
            PluploadQueueChanged: function (uploader) {
                this.updateProgress();
            },
            PluploadRefresh: function (uploader) {
                this.updateStore(uploader.files);
                this.updateProgress();
            },
            PluploadStateChanged: function (uploader) {
                if (uploader.state == 2) {
                    this.fireEvent('uploadstarted', this);
                    this.getTopToolbar().getComponent('cancel').setDisabled(false);
                } else {
                    this.fireEvent('uploadcomplete', this, this.success, this.failed);
                    this.getTopToolbar().getComponent('cancel').setDisabled(true);
                }
            },
            PluploadUploadFile: function () {
                this.loadedFile = 0;
            },
            PluploadUploadProgress: function (uploader, file) {

                // no chance to stop here. We get no response-text from the server.
                // So just continue if something fails here. Will be fixed in next update, says plupload.
                if (file.server_error) {
                    file.status = 4;
                }

                this.updateStoreFile(file);
                this.updateProgress(file);
                this.loadedFile = file.loaded;
            },
            PluploadError: function (uploader, data) {
                data.file.status = 4;

                if (data.code == -600) {
                    data.file.msg = Ext.String.format('<span style="color: red">{0}</span>', this.texts.statusInvalidSizeText);
                } else if (data.code == -602) {
                    data.file.msg = Ext.String.format('<span style="color: red">{0}</span>', this.texts.statusDuplicateText);
                } else if (data.code == -700) {
                    data.file.msg = Ext.String.format('<span style="color: red">{0}</span>', this.texts.statusInvalidExtensionText);
                } else {
                    data.file.msg = Ext.String.format('<span style="color: red">{2} ({0}: {1})</span>', data.code, data.details, data.message);
                }
                this.getTopToolbar().getComponent('delete').setDisabled(false);
                this.updateStoreFile(data.file);
                this.updateProgress();
            },
            linkDocument: function (uploader, file) {

                var a = {
                    'installParameters': 'URLGIS=http%3A%2F%2Fserver%2Fattachments%2Fgiswo%2Ftenant%2F',
                    'createAndCopyToWO': '',
                    'labelNames': '',
                    'secorganization': '',
                    'documentType': 'U',
                    'idmsrvr': '',
                    'hosted': '+',
                    'daeType': '*',
                    'can_select': true,
                    'documentFileName': file.name,
                    'metaData': '',
                    'daeUpdateCount': '',
                    'can_delete': true,
                    'entityCategory': '',
                    'action': 'add',
                    'savebeforeupload': '',
                    'can_update': true,
                    'entityCode': '',
                    'entityjobtype': '',
                    'deptsecreadonly': '',
                    'entityType': '*',
                    'callerUserFunc': EAM.Utils.getScreen().getUserFunction(),
                    'documentFileType': '',
                    'nodeCategory': '',
                    'canViewOnly': '',
                    'daeCode': uploader.settings.EAMParams['daeCode'],
                    'documentorganizationcode': '',
                    'daeParentPKColumnNames': '',
                    'callerTab': 'DOC',
                    'entityRType': '*',
                    'daeParentPKKey': '',
                    'organization': docMultiOrg ? uploader.settings.EAMParams['organization'] : '*',
                    'daeRentity': uploader.settings.EAMParams['daeRentity'],
                    'entity': uploader.settings.EAMParams['daeRentity'],
                    'can_insert': true,
                    'cancel': '',
                    'copydocument': '',
                    'upload': '',
                    'document': file.documentcode,
                    'save': '',
                    'description': file.name,
                    'copytopo': '',
                    'copylink': false,
                    'copytowo': '',
                    'printwreport': '',
                    'printwpo': '',
                    'filepath': file.name,
                    'viewdocument': '',
                    'printwwo': '',
                    'removelink': '',
                    'extId': '',
                    'USER_FUNCTION_NAME': 'BSDOCA',
                    'SYSTEM_FUNCTION_NAME': 'BSDOCA'
                };

                EAM.Ajax.request({
                    url: EAM.Utils.getScreen().getSystemFunction() + ".DOC.insert",
                    params: a,
                    onSuccess: function (success, request, response) {},
                    callbackScope: this,
                    async: true,
                    /* messagingOptions: {
                    deferError: true
                    }, */
                    disableMask: true
                });

            }
        });

        Ext.define('ET.view.knowlet.Upload', {
            extend: 'Ext.window.Window',
            alias: ['widget.widgetupload'],

            height: '60%',
            width: '60%',
            layout: {
                type: 'fit'
            },
            // to force user close window e.g. after upload
            // cause in multipart_params are file specific data like url of document, id of entry etc.
            closeAction: 'destroy',

            // to prevent from opening more upload windows
            modal: true,

            id: 'upload',

            title: 'Documenten uploaden/koppelen',

            listeners: {
                beforerender: function () {
                    var me = this;
                    if (Ext.get(me.id)) {
                        return false;
                    }
                },
                close: function () {
                    if (Ext.isFunction(EAM.Utils.getScreen().getCurrentTab().resetTab)) {
                        EAM.Utils.getScreen().getCurrentTab().resetTab();
                    } else if (Ext.isFunction(EAM.Utils.getScreen().getCurrentTab)) {
                        if (EAM.Utils.getScreen().getCurrentTab().tabName == 'DOC') {
                            try {
                                var h = this,
                                b = EAM.Utils.getScreen(),
                                a = b.down('uxtabpanel').getActiveTab(),
                                f = a.down(a.tabXtype),
                                g = a.down('form'),
                                c = Ext.isFunction(b['getListView']) ? b.getListView() : null,
                                d = (c) ? c.getActiveRecord() : null;
                                f.loadRecordData({
                                    record: d,
                                    appendParams: {
                                        metaData: g.responseData.pageData.values.metaData
                                    }
                                });
                            } catch (error) {
                                console.log(error);
                            }
                        }
                    }
                }
            },

            initComponent: function () {
                var me = this;

                Ext.applyIf(me, {
                    items: [{
                            xtype: 'uploadpanel',
                            url: me.url,
                            multipart_params: me.multipart_params || null,
                            header: false,
                            //pluploadRuntimes: 'html5',
                            EAMParams: me.EAMParams || null
                        }
                    ]
                });

                me.callParent(arguments);
            }

        });

    },

    btnClick: function () {
        var c = this,
        a = EAM.Utils.getScreen(),
        e = a.down('recordview'),
        d = a.getListView().getActiveRecord(),
        b;

        if (d) {
            b = Ext.Object.merge(e.getViewParams(e.getKeyFieldValues(d)), EAM.utils.Document.getDocumentParams(a));
            Ext.apply(b, {
                CURRENT_TAB_NAME: 'DOC',
                skip_tree_fetch: !0
            });
            EAM.Ajax.request({
                url: a.getSystemFunction() + '.DOC',
                params: b,
                async: !0,
                disableMask: !0,
                onSuccess: Ext.Function.pass(c.finishUploadDocument, [], c)
            })
        } else {
            EAM.Messaging.showError(EAM.Lang.getMessage('MSG_ERR_ACTION_WITH_NO_RECORD_SELECTED'))
        }

    },

    finishUploadDocument: function (e, f, c) {
        var b = this,
        a = c ? c.pageData : null,
        d;

        if (e !== !1 && a) {
            var vUploadPanel = Ext.create('ET.view.knowlet.Upload', {
                url: "../" + EAM.SessionStorage.handleEamId("BSIMPT.BDU.batch" + "?"),
                EAMParams: {
                    "daeCode": a.values.daeCode,
                    "organization": docMultiOrg ? a.values.organization : '*',
                    "daeRentity": a.values.daeRentity
                }
            });

            vUploadPanel.show();
        }
    },

    createButton: function (formpanel) {
        var me = this;

        var maintoolbar = EAM.Utils.getMainToolbar(),
        bUpdocs = {
            id: 'updocsButton',
            itemId: 'updocsButton',
            iconCls: 'toolbarUpload',
            overflowText: 'Documenten uploaden/koppelen',
            tooltip: 'Documenten uploaden/koppelen',
            hidden: false,
            disabled: false,
            style: {
                'background-color': '#eddec2'
            },
            handler: function () {
                me.btnClick();
            }
        };

        if (eamVersion.startsWith('11.2')) {
            Ext.merge(bUpdocs, {
                iconCls: 'toolbarExitApp',
                style: {
                    'transform': 'rotate(-90deg)'
                }
            });
        } else if (eamVersion.startsWith('11.6') || eamVersion.startsWith('11.7')) {
            Ext.merge(bUpdocs, {
                iconCls: 'toolbarExit',
                style: {
                    'transform': 'rotate(90deg)'
                }
            });
        }

        try {
            var uploadButton = maintoolbar.down('button[action=uploadDocument]');

            if (uploadButton) {
                uploadButton.setHidden(true);
            }

            var updocsButton = maintoolbar.down('button[itemId=updocsButton]');

            if (Ext.isEmpty(updocsButton)) {
                maintoolbar.insert(13, bUpdocs);
            }

        } catch (error) {
            console.log(error);
        }

    },

    hdr_afterRecordChange: function (formpanel) {
        var me = this,
        vFormPanel = formpanel ? formpanel : this.getFormPanel(),
        // vUploadButton = vFormPanel.getForm().findButton('udfbutton01');
        vUploadButton = Ext.ComponentQuery.query('[itemId=updocsbutton]')[0];

        if (vUploadButton) {
            if (vFormPanel.isInsertMode()) {
                vUploadButton.setDisabled(true);
            } else {
                vUploadButton.setDisabled(false);
            }
        }

    }
});

function resetButtons(tabName, formPanel) {
    var a = formPanel.getForm().getFieldsAndButtons();
    if (tabName === 'U1') {

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
function protectHdrField(formPanel, pAction) {
    try {
        EAM.Utils.debugMessage("protectHdrField function called !");

        var vPageMode = formPanel.getFldValue("pagemode");
        if (vPageMode === "view") {
            h = {
                "workorder": "protected"
            };
            EAM.Builder.setFieldState(h, formPanel.getForm().getFields());

        }
    } catch (err) {
        EAM.Utils.debugMessage("Error in protectHdrField function is " + err);
    }
};

function protectAllFields(tabName, formPanel) {
    var a = formPanel.getForm().getFieldsAndButtons();

    if (tabName === 'U1') {

        var h = {};

        for (var i = 0; i < a.keys.length; i++) {
            var c = a.keys[i];
            //if (tabName === 'HDR' && c === 'workorderstatus') {
            //    continue;
            //}
            h[c] = "protected";

        }
        EAM.Builder.setFieldState(h, formPanel.getForm().getFields());

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

    } else {
        EAM.Builder.setFieldState({
            'pagelayout': 'optional'
        }, a)
    }
};

function setLineNo(formPanel) {
    //Setting next sequence no on TAB
    var vWoSeq = getSequenceNo(formPanel.getFldValue("wspf_10_cos_case"), formPanel.screen._listView.activeRecord.data.organization);
    EAM.Utils.debugMessage("sequence No " + vWoSeq);
    if (vWoSeq === 0) {
        if (Ext.isEmpty(formPanel.getFldValue("wspf_10_cos_line"))) {

            formPanel.setFldValue("wspf_10_cos_line", 10, true);
        }
    } else {
        if (Ext.isEmpty(formPanel.getFldValue("wspf_10_cos_line"))) {
            vWoSeq = vWoSeq.replaceAll(',', '');
            vWoSeq = vWoSeq.replaceAll('.', '');
            var maxLineNumber = Number(vWoSeq);
            formPanel.setFldValue("wspf_10_cos_line", +vWoSeq + 10, true);
        }
    }
};
function getSequenceNo(vCaseCode, caseOrganization) {
    try {
        var vRequest = {
            SYSTEM_FUNCTION_NAME: "BSUDSC",
            USER_FUNCTION_NAME: userFunction,
            CURRENT_TAB_NAME: userFunctionTab,
            casecode: vCaseCode,
            organization: caseOrganization,
            GRID_NAME: userFunction + '_' + userFunctionTab,
            ADDON_SORT_ELEMENT_ALIAS_NAME: 'wspf_10_cos_line',
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
            vSeq = vrecords[0].wspf_10_cos_line
        } else if (vrecords.length === 0) {
            vSeq = 0;
        }
        return vSeq;
    } catch (err) {
        EAM.Utils.debugMessage("getSequenceNo err :" + err);
    }

};

function setU1DefaultValues(formPanel, pAction) {
    EAM.Utils.debugMessage("setU1DefaultValues function called !");

    var todayDate = new Date();
    todayDate = Ext.Date.format(todayDate, 'm/d/Y H:i');
    console.log("todayDate: " + todayDate);
    formPanel.setFldValue("wspf_10_cos_date", todayDate, true);

    maintainFormPanelState(formPanel);
};

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

function setFldWidth(formPanel) {
    try {
        debug && console.log('setFldWidth() called');

        var vLineNoFld = formPanel.getFld("wspf_10_cos_line");
        var vAfasNoFld = formPanel.getFld("wspf_10_cos_afas");
        var vDescFld = formPanel.getFld("wspf_10_cos_costdesc");
        var vCostCodeDesc = formPanel.getFld("wspf_10_cos_costcodedesc");

        if (!Ext.isEmpty(vAfasNoFld)) {
            vAfasNoFld.setWidth(vLineNoFld.getWidth());
        }
        if (!Ext.isEmpty(vDescFld)) {
            vDescFld.setWidth(vLineNoFld.getWidth());
        }
        if (!Ext.isEmpty(vCostCodeDesc)) {
            vCostCodeDesc.setWidth(vLineNoFld.getWidth());
        }

    } catch (e) {
        debug && console.log('Error in setFldWidth : ' + e);
    }
};

function overridelovfield(pFormPanel, pField) {
    try {
        console.log('overridelovfield called');
        if (pField.name != 'workorder') {
            if (newRecord === true) {
                var vOrganization = vOrg;
                var vEquip = "";
                var vClassgp = "";

            } else {

                var vOrganization = pFormPanel.screen._listView.activeRecord.data.organization;
                var vEquip = pFormPanel.screen._listView.activeRecord.data.equipment;
                var vClassgp = pFormPanel.screen._listView.activeRecord.data.orgoption_clgroup;
            }
        }
        if (pField.name == 'wspf_10_cos_costcode') {
            var vLookUpLOV = {
                lovName: 'LVCSTC',
                inputVars: {
                    'control.org': vOrg

                },
                returnFields: {
                    'wspf_10_cos_costcode': 'costcode',
                    'wspf_10_cos_costcodedesc': 'des_text'
                }
            };
        } else if (pField.name == 'problemcode') {
            var vLookUpLOV = {
                lovName: 'LVRECO',
                inputVars: {
                    'param.objclass': " ",
                    'param.objclassorg': " ",
                    'parameter.equipment': vEquip,
                    'parameter.equipmentorg': vOrganization,
                    'param.clgroup': vClassgp,
                },
                returnFields: {
                    'problemcode': 'problemcode',
                    'casedescription': 'description'
                }
            };
        } else if (pField.name == 'workorder') {
            var vLookUpLOV = {
                lovName: 'LVCASEWO',
                inputVars: {
                    'control.org': pFormPanel.getFldValue("organization"),
                    'param.workorder': pFormPanel.getFldValue("workorder")
                },
                returnFields: {
                    'workorder': 'workorder',
                    'equipment': 'woequipment',
                    'equipmentorg': 'woequipmentorg'
                }
            };
        }
        pField.lookupLOV = vLookUpLOV;
        pField.validateLOV = vLookUpLOV;
        pField.extraLOVParams = null;
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
        newRecord = false;
    } catch (err) {
        console.log('error in overridelovfield : ' + err);
    }
};
function gridCall(pFormPanel, vWorkordernum) {
    try {
        var Vworkorders = pFormPanel.getFldValue("workorder");
        var vRequest = {
            GRID_NAME: "LVCASEWO",
            GRID_TYPE: "LOV",
            REQUEST_TYPE: "LOV.HEAD_DATA.STORED",
            LOV_TAGNAME: "workorder",
            MADDON_FILTER_ALIAS_NAME_1: 'workorder',
            MADDON_FILTER_OPERATOR_1: '=',
            MADDON_FILTER_VALUE_1: Vworkorders,
            MADDON_FILTER_JOINER_1: 'AND',
            MADDON_FILTER_SEQNUM_1: '1',

            LOV_ALIAS_NAME_1: "control.org",
            LOV_ALIAS_VALUE_1: pFormPanel.getFldValue("organization"),
            LOV_ALIAS_TYPE_1: "text",

            LOV_ALIAS_NAME_2: "param.workorder",
            LOV_ALIAS_VALUE_2: Vworkorders,
            LOV_ALIAS_TYPE_2: "text",

            CURRENT_TAB_NAME: "HDR",
            USER_FUNCTION_NAME: "SCHADE",
        };

        var response = EAM.Ajax.request({
            url: "LOVPOP",
            params: vRequest
        });

        var vRecords = response.responseData.pageData.grid.GRIDRESULT.GRID.DATA;
        if (!Ext.isEmpty(vRecords) || vRecords != "undefined") {
            pFormPanel.setFldValue("equipment", vRecords[0].woequipment, true);
            pFormPanel.setFldValue("equipmentorg", vRecords[0].woequipmentorg, true);

        }
    } catch (err) {
        EAM.Utils.debugMessage("gridCall err :" + err);
    }
};

function gridCallCostCode(pFormPanel, vCostCode) {
    try {
        var Vworkorders = pFormPanel.getFldValue("wspf_10_cos_costcode");
        var vRequest = {
            GRID_NAME: "LVCSTC",
            GRID_TYPE: "LOV",
            REQUEST_TYPE: "LOV.HEAD_DATA.STORED",
            LOV_TAGNAME: "wspf_10_cos_costcode",
            MADDON_FILTER_ALIAS_NAME_1: 'costcode',
            MADDON_FILTER_OPERATOR_1: '=',
            MADDON_FILTER_VALUE_1: vCostCode,
            MADDON_FILTER_JOINER_1: 'AND',
            MADDON_FILTER_SEQNUM_1: '1',

            LOV_ALIAS_NAME_1: "control.org",
            LOV_ALIAS_VALUE_1: pFormPanel.screen._listView.activeRecord.data.organization,
            LOV_ALIAS_TYPE_1: "text",

            CURRENT_TAB_NAME: "U1",
            USER_FUNCTION_NAME: "SCHADE",
        };

        var response = EAM.Ajax.request({
            url: "LOVPOP",
            params: vRequest
        });

        var vRecords = response.responseData.pageData.grid.GRIDRESULT.GRID.DATA;
        if (!Ext.isEmpty(vRecords) || vRecords != "undefined") {
            pFormPanel.setFldValue("wspf_10_cos_costcode", vRecords[0].costcode, true);
            pFormPanel.setFldValue("wspf_10_cos_costcodedesc", vRecords[0].des_text, true);

        }
    } catch (err) {
        EAM.Utils.debugMessage("gridCallCostCode err :" + err);
    }
};
function overrideProblemlovfield(pFormPanel, pField) {
    try {
        console.log('overrideProblemlovfield called');
        var vPageMode = pFormPanel.getFldValue("pagemode");
        console.log('page mode is ' + vPageMode);

        if (vPageMode == "display") {
            var vOrganization = pFormPanel.getFldValue("organization");
            var vEquip = pFormPanel.getFldValue("equipment");
            var vClassgp = pFormPanel.getFldValue("orgoption_clgroup");

        } else {

            var vOrganization = pFormPanel.screen._listView.activeRecord.data.organization;
            var vEquip = pFormPanel.screen._listView.activeRecord.data.equipment;
            var vClassgp = pFormPanel.screen._listView.activeRecord.data.orgoption_clgroup;
        }
        console.log('page mode is ' + vPageMode + 'org is ' + vOrganization + 'equip is ' + vEquip + 'classgrp is ' + vClassgp);

        if (pField.name == 'problemcode') {
            var vLookUpLOV = {
                lovName: 'LVRECO',
                inputVars: {
                    'param.objclass': " ",
                    'param.objclassorg': " ",
                    'parameter.equipment': vEquip,
                    'parameter.equipmentorg': vOrganization,
                    'param.clgroup': vClassgp,
                },
                returnFields: {
                    'problemcode': 'problemcode',
                    'casedescription': 'description',
                }
            };
        }

        pField.lookupLOV = vLookUpLOV;
        pField.validateLOV = vLookUpLOV;
        pField.extraLOVParams = null;
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

    } catch (err) {
        console.log('error in overrideProblemlovfield : ' + err);
    }
};

function setReturnFields(pFormPanel, pField) {
    try {
        console.log('overrideProblemlovfield called');
        var vPageMode = pFormPanel.getFldValue("pagemode");
        console.log('page mode is ' + vPageMode);

        if (vPageMode == "display") {
            var vOrganization = pFormPanel.getFldValue("organization");

            var vEquip = pFormPanel.getFldValue("equipment");
            var vClassgp = pFormPanel.getFldValue("orgoption_clgroup");

        } else {

            var vOrganization = pFormPanel.screen._listView.activeRecord.data.organization;
            var vEquip = pFormPanel.screen._listView.activeRecord.data.equipment;
            var vClassgp = pFormPanel.screen._listView.activeRecord.data.orgoption_clgroup;
        }
        console.log('page mode is ' + vPageMode + 'org is ' + vOrganization + 'equip is ' + vEquip + 'classgrp is ' + vClassgp);
        var vproblemcode = pFormPanel.getFldValue("problemcode");
        var requestData = {
            GRID_NAME: "LVRECO",
            GRID_TYPE: "LOV",
            REQUEST_TYPE: "LOV.HEAD_DATA.STORED",
            LOV_TAGNAME: 'problemcode',
            MADDON_FILTER_ALIAS_NAME_1: 'problemcode',
            MADDON_FILTER_OPERATOR_1: '=',
            MADDON_FILTER_VALUE_1: vproblemcode,
            MADDON_FILTER_JOINER_1: 'AND',
            MADDON_FILTER_SEQNUM_1: '1',
            LOV_ALIAS_NAME_1: "parameter.objclass",
            LOV_ALIAS_VALUE_1: " ",
            LOV_ALIAS_TYPE_1: "text",
            LOV_ALIAS_NAME_1: "parameter.objclassorg",
            LOV_ALIAS_VALUE_1: "",
            LOV_ALIAS_TYPE_1: "text",
            LOV_ALIAS_NAME_1: "parameter.equipment",
            LOV_ALIAS_VALUE_1: vEquip,
            LOV_ALIAS_TYPE_1: "text",
            LOV_ALIAS_NAME_1: "parameter.equipmentorg",
            LOV_ALIAS_VALUE_1: vOrganization,
            LOV_ALIAS_TYPE_1: "text",
            LOV_ALIAS_NAME_1: "parameter.clgroup",
            LOV_ALIAS_VALUE_1: vClassgp,
            LOV_ALIAS_TYPE_1: "text",

            USER_FUNCTION_NAME: "SCHADE",
            SYSTEM_FUNCTION_NAME: "SCHADE",
            COMPONENT_INFO_TYPE: "DATA_ONLY"
        };

        var response = EAM.Ajax.request({
            url: "GRIDDATA",
            params: requestData
        });
        var vProblemCode = response.responseData.pageData.grid.GRIDRESULT.GRID.DATA[0].problemcode;
        var vDescription = response.responseData.pageData.grid.GRIDRESULT.GRID.DATA[0].description;

        pFormPanel.setFldValue("problemcode", vProblemCode, true);
        pFormPanel.setFldValue("casedescription", vDescription, true);
        pFormPanel.setFldValue("datecreated", " ", true);
        datecreated

    } catch (err) {
        console.log('error in overrideProblemlovfield : ' + err);
    }
};

function populateCostGrid(pFormPanel) {
    try {
        var woNumber = pFormPanel.screen._listView.activeRecord.data.workorder;
        var requestData = {
            GRID_NAME: "NUCOST",
            GRID_TYPE: "LOV",
            REQUEST_TYPE: "LOV.HEAD_DATA.STORED",
            LOV_ALIAS_NAME_1: "parameter.evtcode",
            LOV_ALIAS_VALUE_1: woNumber,
            LOV_ALIAS_TYPE_1: "text",

            CURRENT_TAB_NAME: "U1",
            USER_FUNCTION_NAME: "SCHADE",
            SYSTEM_FUNCTION_NAME: "SCHADE",
            COMPONENT_INFO_TYPE: "DATA_ONLY"
        };

        var response = EAM.Ajax.request({
            url: "LOVPOP",
            params: requestData
        });

        var vCost = response.responseData.pageData.grid.GRIDRESULT.GRID.DATA[0].evtcost;

        EAM.Utils.debugMessage("vCost is " + vCost);
        pFormPanel.setFldValue("wspf_10_cos_cost", vCost, true);
    } catch (err) {
        console.log('error in populateCostGrid : ' + err);
    }

};
function clearFldCopyRec(formPanel) {
    try {
        EAM.Utils.debugMessage("clearFldCopyRec function called");
        formPanel.setFldValue("assignedto", "", true);
        formPanel.setFldValue("problemcode", "", true);
        formPanel.setFldValue("udfchar01", "", true);
        formPanel.setFldValue("udfchar02", "", true);
        formPanel.setFldValue("udfchar03", "", true);
        formPanel.setFldValue("workorder", "", true);
        formPanel.setFldValue("equipment", "", true);
        formPanel.setFldValue("equipmentdesc", "", true);
    } catch (e) {
        EAM.Utils.debugMessage('Error in clearFldCopyRec : ' + e);
    }
};

/* function callGrid(formPanel) {
try {
EAM.Utils.debugMessage("callGrid called !");

var vUdfChar04 = formPanel.getFldValue("udfchar04");
EAM.Utils.debugMessage("vUdfChar04 FldValue is:" + vUdfChar04);
if (vUdfChar04 == null || vUdfChar04 == "") {
vLoc1DescFld.setValue("");
} else {
var requestData = {
GRID_NAME: "LVUDFCD",
GRID_TYPE: "LOV",
REQUEST_TYPE: "LOV.HEAD_DATA.STORED",
LOV_TAGNAME: "udfchar04",
usagetype: "lov",
MADDON_FILTER_ALIAS_NAME_1: 'userdefinedfieldvalue',
MADDON_FILTER_OPERATOR_1: '=',
MADDON_FILTER_VALUE_1: vUdfChar04,
MADDON_FILTER_JOINER_1: 'AND',
MADDON_FILTER_SEQNUM_1: '1',
USER_FUNCTION_NAME: "SCHADE",
CURRENT_TAB_NAME: "HDR",
LOV_ALIAS_NAME_1: "param.rentity",
LOV_ALIAS_VALUE_1: "CASE",
LOV_ALIAS_TYPE_1: "text",
LOV_ALIAS_NAME_2: "param.field",
LOV_ALIAS_VALUE_2: "udfchar04",
LOV_ALIAS_TYPE_2: "text",
LOV_ALIAS_NAME_3: "param.fieldid",
LOV_ALIAS_VALUE_3: "udfchar04",
LOV_ALIAS_TYPE_3: "text",
LOV_ALIAS_NAME_3: "param.associatedrentity",
LOV_ALIAS_VALUE_3: "CASE",
LOV_ALIAS_TYPE_3: "text",

};
var response = EAM.Ajax.request({
url: "LOVPOP",
params: requestData

});
EAM.Utils.debugMessage("requestData get!!");
var vRecords = response.responseData.pageData.grid.GRIDRESULT.GRID.DATA;
EAM.Utils.debugMessage("vRecords value is: " + vRecords);
vLoc1DescFld.setValue(vRecords[0].description);
EAM.Utils.debugMessage("responseData get!!");
}
} catch (e) {
EAM.Utils.debugMessage(' Error in callGrid: ' + e);
}
}; */

function overrideProblemcode(formPanel, pField) {
    try {
        debug && console.log('overrideProblemcode() called');

        var vProblemCode = formPanel.getFldValue("problemcode");
        //var vOrganization = formPanel.screen._listView.activeRecord.data.organization;
        //var vEquip = formPanel.screen._listView.activeRecord.data.equipment;
        //var vClassgp = formPanel.screen._listView.activeRecord.data.orgoption_clgroup;
        debug && console.log(vProblemCode);

        var vLookUpLOV = {
            lovName: 'LVPROBLEM',
            //inputVars: {
            //    'param.objclass': " ",
            //    'param.objclassorg': " ",
            //    'parameter.equipment': vEquip,
            //    'parameter.equipmentorg': vOrganization,
            //    'param.clgroup': vClassgp,
            //},
            returnFields: {
                'udfchar28': 'LVPROBLEMCODE',
                'casedescription': 'LVPROBLEMDESC'
            }
        };

        pField.lookupLOV = vLookUpLOV;
        pField.validateLOV = vLookUpLOV;
        pField.extraLOVParams = null;
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

    } catch (err) {
        debug && console.log('error in overrideProblemcode() : ' + err);
    }
};
function callGridudfchar28(formPanel) {
    try {
        EAM.Utils.debugMessage("callGridudfchar28() called !");

        var Vudfchar28 = formPanel.getFldValue("udfchar28");
        debug && console.log(Vudfchar28);
        //SPC-416 Case description set to manual value when entered
        if ((formPanel.getFldValue("udfchar28") == null || formPanel.getFldValue("udfchar28") == "") && formPanel.getFldValue("casedescription") == "") {
            formPanel.setFldValue('casedescription', 'SCHADEDOSSIER', true);

        } else if (!(formPanel.getFldValue("udfchar28") == null || formPanel.getFldValue("udfchar28") == "")) {
            var requestData = {
                GRID_NAME: "LVPROBLEM",
                GRID_TYPE: "LOV",
                REQUEST_TYPE: "LOV.HEAD_DATA.STORED",
                LOV_TAGNAME: "udfchar28",
                usagetype: "lov",
                MADDON_FILTER_ALIAS_NAME_1: 'lvproblemcode',
                MADDON_FILTER_OPERATOR_1: '=',
                MADDON_FILTER_VALUE_1: Vudfchar28,
                MADDON_FILTER_JOINER_1: 'AND',
                MADDON_FILTER_SEQNUM_1: '1',
                USER_FUNCTION_NAME: "SCHADE",
                CURRENT_TAB_NAME: "HDR",

                LOV_ALIAS_NAME_1: 'param.objclass',
                LOV_ALIAS_VALUE_1: '',
                LOV_ALIAS_TYPE_1: 'text',
                LOV_ALIAS_NAME_2: 'param.objclassorg',
                LOV_ALIAS_VALUE_2: '',
                LOV_ALIAS_TYPE_2: 'text',
                LOV_ALIAS_NAME_3: 'parameter.equipment',
                LOV_ALIAS_VALUE_3: formPanel.getFldValue("equipment"),
                LOV_ALIAS_TYPE_3: 'text',
                LOV_ALIAS_NAME_4: 'parameter.equipmentorg',
                LOV_ALIAS_VALUE_4: formPanel.getFldValue("organization"),
                LOV_ALIAS_TYPE_4: 'text',
                LOV_ALIAS_NAME_5: 'param.clgroup',
                LOV_ALIAS_VALUE_5: 'OFF',
                LOV_ALIAS_TYPE_5: 'text',
            };
            var response = EAM.Ajax.request({
                url: "LOVPOP",
                params: requestData

            });
            EAM.Utils.debugMessage("requestData get!!");
            var vRecords = response.responseData.pageData.grid.GRIDRESULT.GRID.DATA;
            formPanel.setFldValue('casedescription', vRecords[0].lvproblemdesc);
            EAM.Utils.debugMessage("responseData get!!");
        }
    } catch (e) {
        EAM.Utils.debugMessage(' Error in callGridudfchar28: ' + e);
    }
};
