/*
-- -------------------------------------------------------------------------------
--
-- Copyright © 2022 by Spectades BV
--
-- Filename    : QBUZZ_external_wstrad.txt
--
-- Description : Extensible Framework JavaScript WSTRAD - New Tab on WSTRAD
-
-- Product     : EAM             Release : 11.7
--
-- Author      :MCT
--
-- CHANGE HISTORY
--
-- 0001 21-11-2022 - MCT - WSTRAD - New Tab on WSTRAD i.e., Supplier Trade Rates
-- 0002 25-11-2022 - SPC-295 Override lookups for org,ven,toh,mrc on U1 tab.
-- -------------------------------------------------------------------------------
 */

var vFunCode = "WSTRAD";
var vTabName = "U1";
var debug = true;

Ext.define('EAM.custom.external_wstrad', {
    extend: 'EAM.custom.AbstractExtensibleFramework',
    getSelectors: function () {
        thisContext = this;
        return {

            '[extensibleFramework] [tabName=U1]': {
                afterrecordchange: function (a, b) {
                    if (a.userFunction === vFunCode && a.tabName === vTabName) {
                        try {
                            debug && console.log('afterrecordchange called');
                            var formPanel = this.getFormPanel();
                            setOrg(formPanel);

                        } catch (err) {
                            debug && console.log("#after recordchange: " + err);
                        }
                    }
                },
                afterdestroyrecord: function (a, b) {
                    debug && console.log("afterdestroyrecord function called");
                    if (a.userFunction === vFunCode && a.tabName === vTabName) {
                        try {
                            var formPanel = this.getFormPanel();
                            setOrg(formPanel);

                        } catch (err) {
                            debug && console.log('afterdestroyrecord HDR err : ' + err);
                        }
                    }
                }
            },

            '[extensibleFramework] [tabName=U1] lovfield[name=wspf_10_sup_org]': {
                beforetriggerclick: function (field, event) {
                    try {
                        var formPanel = this.getFormPanel();
                        EAM.Utils.debugMessage("beforetriggerclick of wspf_10_sup_org called !");
                        overridelovfield(formPanel, field);
                    } catch (err) {
                        EAM.Utils.debugMessage("Error in supplier lovfield " + err);
                    }
                }

            },
            '[extensibleFramework] [tabName=U1] lovfield[name=wspf_10_sup_ven]': {
                beforetriggerclick: function (field, event) {
                    var formPanel = this.getFormPanel();
                    EAM.Utils.debugMessage("beforetriggerclick of wspf_10_sup_ven called !");
                    overridelovfield(formPanel, field);

                }

            },
            '[extensibleFramework] [tabName=U1] lovfield[name=wspf_10_sup_mrc]': {
                beforetriggerclick: function (field, event) {
                    var formPanel = this.getFormPanel();
                    EAM.Utils.debugMessage("beforetriggerclick of wspf_10_sup_mrc called !");
                    overridelovfield(formPanel, field);

                }

            },
            '[extensibleFramework] [tabName=U1] lovfield[name=wspf_10_sup_toh]': {
                beforetriggerclick: function (field, event) {
                    var formPanel = this.getFormPanel();
                    EAM.Utils.debugMessage("beforetriggerclick of wspf_10_sup_toh called !");
                    overridelovfield(formPanel, field);

                }

            }
        }
    }
});

function overridelovfield(pFormPanel, pField) {
    try {
        console.log('overridelovfield called');
        //var pFormPanel = a.formPanel;
        //var partfld = pFormPanel.getFld("wspf_10_ou_partuom");
        console.log('Field Name is  ' + pField.name);

        if (pField.name == 'wspf_10_sup_org') {
            var vLookUpLOV = {
                lovName: 'LVORGSTAB',
                inputVars: {
                    'parameter.tabname': 'U1',
                    'control.organization': '*'
                },
                returnFields: {
                    'wspf_10_sup_org': 'organization'
                }
            };
        } else if (pField.name == 'wspf_10_sup_ven') {
            var vLookUpLOV = {
                lovName: 'LVUDFE',
                inputVars: {
                    'param.rentity': 'COMP',
                    'param.field': pFormPanel.getFldValue("wspf_10_sup_ven"),
                    'param.fieldid': pFormPanel.getFldValue("wspf_10_sup_ven"),
                    'param.associatedrentity': 'TRDR',
                    'param.lookuprentity': 'COMP',
                    'control.org': pFormPanel.getFldValue("wspf_10_sup_org")
                },
                returnFields: {
                    'wspf_10_sup_ven': 'userdefinedfieldvalue'
                }
            };
        } else if (pField.name == 'wspf_10_sup_mrc') {
            var vLookUpLOV = {
                lovName: 'LVMRCS',
                inputVars: {
                    'param.showstardepartment': 'true',
                    'control.org': pFormPanel.getFldValue("wspf_10_sup_org")
                },
                returnFields: {
                    'wspf_10_sup_mrc': 'department'
                }
            };
        } else if (pField.name == 'wspf_10_sup_toh') {
            var vLookUpLOV = {
                lovName: 'LVALLTPHS',
                inputVars: {},
                returnFields: {
                    'wspf_10_sup_toh': 'typeofhours'
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
        console.log('error in overrideBaselovfield : ' + err);
    }
};

function setOrg(formPanel) {
    debug && console.log('setOrg() called');
    var orgField = formPanel.getForm().findField('wspf_10_sup_org');
    formPanel.setFldValue('wspf_10_sup_org', EAM.AppData.getInstallParams().get('userorg'), true);
};
