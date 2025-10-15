/*
-- -------------------------------------------------------------------------------
--
-- Copyright © 2025 by MCT
--
-- Filename    : external_OSOBJP.txt
--
-- Description : Extensible Framework JavaScript OSOBJP.
--
-- Product     : EAM             Release : 12.2.0         Build : Build 2
--
-- Author      : MCT
--
-- CHANGE HISTORY
--
-- 0001 Date - 03-06-2025 SPC-698 MCT - Initial version.
-- 0002 Date - 03-06-2025 SPC-698 MCT - Show and require DORM fields only in GS,show (not required) in ATS, hide in all other statuses.
-- -------------------------------------------------------------------------------
 */
var DEBUG = true;

Ext.define('EAM.custom.external_OSOBJP', {
    extend: 'EAM.custom.AbstractExtensibleFramework',

    getSelectors: function () {
        return {
            '[extensibleFramework] [tabName=HDR]': {

                afterrender: function (a, b) {
                    try {
                        DEBUG && console.log("#HDR afterrender function called !");
                        var formPanel = this.getFormPanel();
                        fieldAttributeChanges(formPanel);
                    } catch (e) {
                        DEBUG && console.log('#HDR afterrender Error: ', e);
                    }
                },
                afterrecordchange: function (a, b) {
                    try {
                        DEBUG && console.log("#HDR afterrecordchange function called !");
                        var formPanel = this.getFormPanel();
                        fieldAttributeChanges(formPanel);
                    } catch (e) {
                        DEBUG && console.log('#HDR afterrecordchange Error: ', e);
                    }
                },
                afterreset: function (a, b) {
                    try {
                        DEBUG && console.log("#HDR afterreset function called !");
                        var formPanel = this.getFormPanel();
                        fieldAttributeChanges(formPanel);
                    } catch (e) {
                        DEBUG && console.log('#HDR afterreset Error: ', e);
                    }
                },
                aftersaverecord: function (a, b, c, d) {
                    try {
                        if (d.pageData.success == true) {
                            DEBUG && console.log("#HDR aftersaverecord function called !");
                            var formPanel = this.getFormPanel();
                            fieldAttributeChanges(formPanel);
                        }
                    } catch (e) {
                        DEBUG && console.log('#HDR aftersaverecord Error: ', e);
                    }
                },
            },
        };
    },
});
function fieldAttributeChanges(f) {
    try {
        DEBUG && console.log("fieldAttributeChanges() called!");
        var vFld = {}
        var vstatus = f.getFldValue("assetstatus");
		DEBUG && console.log("Status: ",vstatus);
        if (vstatus === "GS") {
            vFld = {
                "dormantstart": "required",
                "dormantend": "required"
            }
        } else if (vstatus === "ATS") {
            vFld = {
                "dormantstart": "optional",
                "dormantend": "optional"
            }
        } else {
            vFld = {
                "dormantstart": "hidden",
                "dormantend": "hidden"
            }
        }
        EAM.Builder.setFieldState(vFld, f.getForm().getFields());
    } catch (err) {
        DEBUG && console.log("fieldAttributeChanges() error:", err);
    }
}
