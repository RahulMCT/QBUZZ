/*
-- -------------------------------------------------------------------------------
--
-- Copyright © 2023 by Spectades BV
--
-- Filename: external_osobjx.txt
--
-- Description: Extensible Framework JavaScript external_osobjx
--
-- Product    : EAM             Release: 12.0.1        Build: 1
--
-- Author     : MCT
--
-- CHANGE HISTORY
--
-- 0001 20-08-2024 - MCT - Code updated for PRD environment
-- 0002 20-08-2024 - MCT - Supplier DESC virtual field created
-- 0003 20-08-2024 - MCT - (SPC-543) Populated DESC in virtual field when udfchar17 is present.
-- 0003 21-08-2024 - MCT - (SPC-543) Bug fixed regarding runtime exceptions.
-- -------------------------------------------------------------------------------
 */

var DEBUG = false;
var leverancierDescriptionField;
var BovenlDescriptionField;

Ext.define('EAM.custom.external_osobjx', {
    extend: 'EAM.custom.AbstractExtensibleFramework',
    getSelectors: function () {
        return {
            '[extensibleFramework] [tabName=HDR]': {
                afterrecordchange: function (a, b) {
                    if (a.initialConfig.screen.userFunction === "OSOBJX" && a.tabName === "HDR") {
                        try {
                            DEBUG && console.log('After Record Change HRD');

                            var formPanel = this.getFormPanel();
                            var vPagemode = formPanel.getFldValue('pagemode');
                            //setLeverancierDescriptionField(formPanel);
                            if (vPagemode === 'view') {
                                FldvaluePoppulted(formPanel);
                            }
                            // setsetBovenlDescriptionField(formPanel);
                            if (Ext.isEmpty(formPanel.getFldValue('udfchar17'))) {
                                formPanel.setFldValue('cntudfchar17desc', "", false);
                            }
                            maintainFormPanelState(formPanel);
                        } catch (err) {
                            EAM.Utils.debugMessage("HDR Error :" + err);
                        }
                    }
                },
                afterrender: function (a, b) {
                    if (a.initialConfig.screen.userFunction === "OSOBJX" && a.tabName === "HDR") {
                        try {
                            DEBUG && console.log('After Record Change HRD');

                            var formPanel = this.getFormPanel();

                            leverancierDescriptionField = Ext.create('Ext.form.TextField', {
                                name: "udfchar22Description",
                                fieldLabel: '',
                                margin: '0 0 0 15',
                                width: 320,
                                renderTo: formPanel.getFld("udfchar22").id,
                                readOnly: true,
                            });

                            //setLeverancierDescriptionField(formPanel);

                            //BovenlDescriptionField = Ext.create('Ext.form.TextField', {
                            //    name: "udfchar22Description",
                            //    fieldLabel: '',
                            //    margin: '0 0 0 15',
                            //    width: 320,
                            //    renderTo: formPanel.getFld("parentasset").id,
                            //    readOnly: true,
                            //});
                            var vLoc1 = formPanel.getFld("udfchar17");
                            var vUdfChar17 = formPanel.getFld("udfchar17"),
                            vLabel = vUdfChar17.config.fieldLabel,
                            vLabelWidth = vUdfChar17.config.labelWidth,
                            vContainer = vUdfChar17.up('[hostCmpId=' + vUdfChar17.hostComponent + ']'),
                            vIndex = vContainer.items.indexOf(vUdfChar17);
                            // Field width set
                            console.log('vUdfChar17', vUdfChar17);
                            console.log('vContainer', vContainer);
                            vUdfChar17.setFieldLabel('');

                            var vFieldContainer = Ext.create('Ext.form.FieldContainer', {
                                id: 'fieldContainer1',
                                fieldLabel: vLabel,
                                labelWidth: vLabelWidth,
                                labelPad: 1,
                                layout: 'hbox',
                                style: {
                                    'margin-bottom': '0px'
                                },
                                items: [{
                                        xtype: 'fieldcontainer',
                                        id: 'fieldContainer2',
                                        fieldLabel: '',
                                        layout: 'hbox',
                                        style: {
                                            'margin-bottom': '0px'
                                        },
                                        items: [vUdfChar17, vLoc1DescFld = Ext.create('Ext.form.TextField', {
                                                xtype: 'textfield',
                                                margin: '0 0 0 5',
                                                width: 320,
                                                renderTo: vLoc1.id,
                                                name: "cntudfchar17desc",
                                                id: "cntudfchar17desc",
                                                itemId: "cntudfchar17desc",
                                                readOnly: true,
                                                readOnlyCls: "x-form-text-readonly",
                                                // size: 24,
                                                tabIndex: -1,
                                                validateOnBlur: false,
                                                validateOnChange: false,
                                            })
                                        ]
                                    }
                                ]
                            });

                            vContainer.insert(vIndex, vFieldContainer);
                            setBovenlDescriptionField(formPanel);
                            var vPagemode = formPanel.getFldValue('pagemode');
                            if (vPagemode === 'view') {
                                FldvaluePoppulted(formPanel);
                            }
                            if (Ext.isEmpty(formPanel.getFldValue('udfchar17'))) {
                                formPanel.setFldValue('cntudfchar17desc', "", false);
                            }
                            maintainFormPanelState(formPanel);
                        } catch (err) {
                            EAM.Utils.debugMessage("HDR Error :" + err);
                        }
                    }
                },
                afterreset: function (a, b) {
                    if (a.initialConfig.screen.userFunction === "OSOBJX" && a.tabName === "HDR") {

                        var formPanel = this.getFormPanel();
                        //setLeverancierDescriptionField(formPanel);
                        setBovenlDescriptionField(formPanel);
                        if (Ext.isEmpty(formPanel.getFldValue('udfchar17'))) {
                            formPanel.setFldValue('cntudfchar17desc', "", false);
                        }
                        maintainFormPanelState(formPanel);
                    }
                },
                afternewrecord: function (a, b) {
                    if (a.initialConfig.screen.userFunction === "OSOBJX" && a.tabName === "HDR") {

                        var formPanel = this.getFormPanel();
                        //setLeverancierDescriptionField(formPanel);
                        setBovenlDescriptionField(formPanel);
                        if (Ext.isEmpty(formPanel.getFldValue('udfchar17'))) {
                            formPanel.setFldValue('cntudfchar17desc', "", false);
                        }
                        maintainFormPanelState(formPanel);
                    }
                },
                aftersaverecord: function (a, b, c, d) {
                    if (a.initialConfig.screen.userFunction === "OSOBJX" && a.tabName === "HDR") {
                        if (d.pageData.success === true) {
                            var formPanel = this.getFormPanel();
                            //setLeverancierDescriptionField(formPanel);
                            setBovenlDescriptionField(formPanel);
                            if (Ext.isEmpty(formPanel.getFldValue('udfchar17'))) {
                                formPanel.setFldValue('cntudfchar17desc', "", false);
                            }
                            maintainFormPanelState(formPanel);
                        }
                    }
                },
                afterdestroyrecord: function (a, b) {
                    if (a.initialConfig.screen.userFunction === "OSOBJX" && a.tabName === "HDR") {

                        var formPanel = this.getFormPanel();
                        //setLeverancierDescriptionField(formPanel);
                        setBovenlDescriptionField(formPanel);
                        if (Ext.isEmpty(formPanel.getFldValue('udfchar17'))) {
                            formPanel.setFldValue('cntudfchar17desc', "", false);
                        }
                        maintainFormPanelState(formPanel);
                    }
                },
            },
            '[extensibleFramework] [tabName=HDR] lovfield[name=udfchar17]': {
                beforetriggerclick: function (f) {
                    console.log('beforetriggerclick');
                    var formPanel = this.getFormPanel();
                    FldvaluePoppulted(formPanel);
                    maintainFormPanelState(formPanel);
                },
                blur: function (f) {
                    console.log('blur');
                    var formPanel = this.getFormPanel();
                    FldvaluePoppulted(formPanel);

                    if (Ext.isEmpty(f.getValue())) {
                        f.formPanel.clearFldValues(['cntudfchar17desc']);
                    }
                    maintainFormPanelState(formPanel);
                }
            },
            '[extensibleFramework] [tabName=HDR] lovfield[name=udfchar22]': {
                blur: function (field, event) {
                    var formPanel = this.getFormPanel();
                    DEBUG && console.log('blur udfchar22');
                    setLeverancierDescriptionField(formPanel);
                    maintainFormPanelState(formPanel);
                },

            },
            '[extensibleFramework] [tabName=HDR] lovfield[name=parentasset]': {
                blur: function (field, event) {
                    var formPanel = this.getFormPanel();
                    DEBUG && console.log('blur parentasset');

                    setBovenlDescriptionField(formPanel);
                    maintainFormPanelState(formPanel);

                },

            },

        }
    }
});

function setLeverancierDescriptionField(formPanel) {
    try {
        if (leverancierDescriptionField) {
            var requestData = {
                "GRID_NAME": "LVUDFE",
                "GRID_TYPE": "LOV",
                "REQUEST_TYPE": "LOV.HEAD_DATA.STORED",
                "LOV_TAGNAME": "udfchar22",
                "usagetype": "lov",
                "USER_FUNCTION_NAME": "OSOBJA",
                "CURRENT_TAB_NAME": "HDR",
                "LOV_ALIAS_NAME_1": "param.rentity",
                "LOV_ALIAS_VALUE_1": "COMP",
                "LOV_ALIAS_TYPE_1": "text",
                "LOV_ALIAS_NAME_2": "param.field",
                "LOV_ALIAS_VALUE_2": "udfchar22",
                "LOV_ALIAS_TYPE_2": "text",
                "LOV_ALIAS_NAME_3": "param.fieldid",
                "LOV_ALIAS_VALUE_3": "udfchar22",
                "LOV_ALIAS_TYPE_3": "text",
                "LOV_ALIAS_NAME_4": "param.associatedrentity",
                "LOV_ALIAS_VALUE_4": "OBJ",
                "LOV_ALIAS_TYPE_4": "text",
                "LOV_ALIAS_NAME_5": "param.lookuprentity",
                "LOV_ALIAS_VALUE_5": "COMP",
                "LOV_ALIAS_TYPE_5": "text",
                "LOV_ALIAS_NAME_6": formPanel.getFldValue("organization"),
                "LOV_ALIAS_VALUE_6": "VLOOT",
                "LOV_ALIAS_TYPE_6": "text",
                'filterfields': "userdefinedfieldvalue",
                'filteroperator': "CONTAINS",
                'filtervalue': formPanel.getFldValue("udfchar22")

            };

            var response = EAM.Ajax.request({
                url: "LOVPOP",
                params: requestData
            });
            var vrecords = response.responseData.pageData.grid.GRIDRESULT.GRID.DATA;
            var tmpDescription
            console.log(vrecords);
            console.log(formPanel.getFldValue("udfchar22"));
            for (var i = 0; i < vrecords.length; i++) {

                if (vrecords[i].userdefinedfieldvalue === formPanel.getFldValue("udfchar22")) {
                    tmpDescription = vrecords[i].description
                }
                if (tmpDescription) {
                    leverancierDescriptionField.setValue(tmpDescription);
                } else {
                    leverancierDescriptionField.setValue("");
                }

            }
        }
    } catch (err) {
        EAM.Utils.debugMessage("setLeverancierDescriptionField Error :" + err);
    }
};
function FldvaluePoppulted(f) {
    try {
        console.log("FldvaluePoppulted");
        var vRequest = {
            "GRID_NAME": "LVUDFE",
            "GRID_TYPE": "LOV",
            "REQUEST_TYPE": "LOV.HEAD_DATA.STORED",
            "LOV_TAGNAME": "udfchar17",
            "usagetype": "lov",
            "USER_FUNCTION_NAME": "OSOBJA",
            "CURRENT_TAB_NAME": "HDR",
            "LOV_ALIAS_NAME_1": "param.rentity",
            "LOV_ALIAS_VALUE_1": "COMP",
            "LOV_ALIAS_TYPE_1": "text",
            "LOV_ALIAS_NAME_2": "param.field",
            "LOV_ALIAS_VALUE_2": "udfchar17",
            "LOV_ALIAS_TYPE_2": "text",
            "LOV_ALIAS_NAME_3": "param.fieldid",
            "LOV_ALIAS_VALUE_3": "udfchar17",
            "LOV_ALIAS_TYPE_3": "text",
            "LOV_ALIAS_NAME_4": "param.associatedrentity",
            "LOV_ALIAS_VALUE_4": "OBJ",
            "LOV_ALIAS_TYPE_4": "text",
            "LOV_ALIAS_NAME_5": "param.lookuprentity",
            "LOV_ALIAS_VALUE_5": "COMP",
            "LOV_ALIAS_TYPE_5": "text",
            "LOV_ALIAS_NAME_6": f.getFldValue("organization"),
            "LOV_ALIAS_VALUE_6": "VLOOT",
            "LOV_ALIAS_TYPE_6": "text",
            'filterfields': "userdefinedfieldvalue",
            'filteroperator': "CONTAINS",
            'filtervalue': f.getFldValue("udfchar17")
        };

        var response = EAM.Ajax.request({
            url: "LOVPOP",
            params: vRequest,
            async: false,
        });
        var vSuccessFlag = response.success;
        var supplierDesc = '';
        var vSupplierCode = f.getFldValue("udfchar17");
        if (vSuccessFlag === true) {
            const supplierDetails = response.responseData.pageData.grid.GRIDRESULT.GRID.DATA;
            if (Array.isArray(supplierDetails) && supplierDetails.length > 0) {
                supplierDesc = supplierDetails[0].description;
                if (cntudfchar17desc !== "") { // assuming f.setFldValue checks existence
                    if (vSupplierCode !== "") {
                        f.setFldValue("cntudfchar17desc", supplierDesc); // assuming "storedesc" is the correct field name
                    }
                }
            } else {
                f.setFldValue("cntudfchar17desc", "", false)
                console.log("No data found for vUdfChar17");
            }
        } else {
            vSuccess = "false";
            console.log("Error getting TO Package Line data for vUdfChar17");
        }
    } catch (err) {
        console.log("FldvaluePoppulted error: " + err);
    }
};
function setBovenlDescriptionField(formPanel) {
    try {
        //if (BovenlDescriptionField) {
        //    var requestData = {
        //        'popup': "true",
        //        'GRID_NAME': "LVOBJL_EQ",
        //        'LOV_TAGNAME': "parentasset",
        //        'first_load': "true",
        //        'usagetype': "lov_equipment",
        //        'USER_FUNCTION_NAME': "OSOBJX",
        //        'CURRENT_TAB_NAME': "HDR",
        //        'LOV_ALIAS_NAME_1': "equipmentlookup",
        //        'LOV_ALIAS_VALUE_1': "true",
        //        'LOV_ALIAS_TYPE_1': "text",
        //        'LOV_ALIAS_NAME_2': "param.objectrtype",
        //        'LOV_ALIAS_VALUE_2': "P",
        //        'LOV_ALIAS_TYPE_2': "text",
        //        'LOV_ALIAS_NAME_3': "param.bypasstagoption",
        //        'LOV_ALIAS_VALUE_3': "true",
        //        'LOV_ALIAS_TYPE_3': "text",
        //        'LOV_ALIAS_NAME_4': "param.objectcode",
        //        'LOV_ALIAS_VALUE_4': formPanel.getFldValue("equipmentno"),
        //        'LOV_ALIAS_TYPE_4': "text",
        //        'LOV_ALIAS_NAME_5': "param.objectorg",
        //        'LOV_ALIAS_VALUE_5': formPanel.getFldValue("organization"),
        //        'LOV_ALIAS_TYPE_5': "text",
        //        'filterfields': "equipmentcode",
        //        'filteroperator': "CONTAINS",
        //        'filtervalue': formPanel.getFldValue("parentasset"),
        //        'REQUEST_TYPE': "LIST.HEAD_DATA.STORED"


        //    };

        //    var response = EAM.Ajax.request({
        //        url: "LOVPOP",
        //        params: requestData
        //    });
        //    console.log(response);
        //    var vrecords = response.responseData.pageData.grid.GRIDRESULT.GRID.DATA;

        //    var tmpDescription
        //    console.log(vrecords);
        //    console.log(formPanel.getFldValue("parentasset"));
        //    for (var i = 0; i < vrecords.length; i++) {

        //        if (vrecords[i].equipmentcode === formPanel.getFldValue("parentasset")) {
        //            tmpDescription = vrecords[i].description_obj
        //        }
        //        if (tmpDescription) {
        //            BovenlDescriptionField.setValue(tmpDescription);
        //        } else {
        //            BovenlDescriptionField.setValue("");
        //        }

        //    }
        //    var getBackToCorrectPageCall = EAM.Ajax.request({
        //        url: 'OSOBJP.HDR',
        //        extraParams: {
        //            'SYSTEM_FUNCTION_NAME': 'OSOBJP',
        //            'USER_FUNCTION_NAME': 'OSOBJX',
        //            'CURRENT_TAB_NAME': 'HDR',
        //            'equipmentno': "D.APM.3",
        //            'organization': "VLOOT",
        //            'statusrcode': "I"
        //        }
        //    });
        //}
    } catch (err) {
        EAM.Utils.debugMessage("setBovenlDescriptionField Error :" + err);
    }
};
/***
 *** function to maintain
 *** formPanel State after adding
 *** creating custom fields
 ***/
function maintainFormPanelState(formPanel) {
    try {
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
    } catch (err) {
        console.log("maintainFormPanelState err: " + err);
    }
};
