/*
REM==================================================================================
REM FILE : external_pspord  AUTHOR : MCT
REM CREATION DATE : 19/10/2022
REM VERSION : 1.0
REM DEVELOPER : AVDHESH
REM==================================================================================
REM (c) The contents of this file, and of any file or document derived from
REM it, are copyright to MCT India Infotech Pvt. Ltd. Unlicensed alteration,change or
REM copying in any form, whether written, by photocopy, by disk,by print or
REM by any other methods of reproduction is strictly prohibited.
REM==================================================================================
REM PURPOSE OF FILE
REM Extensible Framework JavaScript for handling field validations
REM =================================================================================
REM CHANGE HISTORY
-- 0001 03-11-2022 - SPC-288 - PSPORD - Comment Block Protected for Parts and Service tab.
-- 0002 17-04-2023 - SPC-328 - Fields protected for new status(GA1) and comment out for GA.
-- 0003 27-05-2023 - Code Merge UpDocs by Maurice(added BSIMPT.BDU intialization call to avoid upload error).
-- 0004 26-06-2023 - Changed udfbutton to maintoolbar button (EAM 12 style)
-- 0005 24-08-2023 - Changed button iconcls for different EAM versions
-- 0006 07-11-2023 - Added close listener to refresh main screen
-- 0007 10-11-2023 - Bug fix: refresh could not be a function
-- 0008 13-05-2024 - Fix after EAM upgrade 12.1.1
-- 0009 07-06-2024 - SPC-528 - description enabled for status 'KA'
REM =================================================================================
 */

var docMultiOrg = true;
var eamVersion = '';

Ext.define('EAM.custom.external_pspord', {
    extend: 'EAM.custom.AbstractExtensibleFramework',
    getSelectors: function () {
        var me = this;

        return {
            '[extensibleFramework] [tabName=LST][isTabView=true]': {
                afterrender: function (f) {
                    if (f.screen.userFunction == 'PSPORD') {
                        if (!EAM.getApplication().designerMode) {
                            me.doAfterrender(f);
                        }
                    }
                }
            },
            '[extensibleFramework] [tabName=HDR]': {
                afterrender: function (f) {
                    if (f.screen.userFunction == 'PSPORD') {
                        if (!EAM.getApplication().designerMode) {
                            me.doAfterrender(f);
                        }
                    }

                    EAM.Utils.debugMessage('afterrender function called !');

                    var formPanel = this.getFormPanel();
                    var vUsrGrp = getUserGroup();
                    var vPageMode = formPanel.getFldValue("pagemode");
                    EAM.Utils.debugMessage('vPageMode value : ' + vPageMode);
                    var vStatus = formPanel.getFldValue("purchaseorderstatus");
                    if ((vUsrGrp === "VLOOT-MAN" && vStatus === "KA" && vPageMode === "view") || (vUsrGrp === "VLOOT-MAN" && vStatus === "GA1" && vPageMode === "view")) {
                        protectHDRFields(formPanel, vStatus);
                    }

                },

                afterreset: function () {
                    EAM.Utils.debugMessage('afterreset function called !');
                    var formPanel = this.getFormPanel();
                    var vPageMode = formPanel.getFldValue("pagemode");
                    var vUsrGrp = getUserGroup();
                    var vStatus = formPanel.getFldValue("purchaseorderstatus");
                    if ((vUsrGrp === "VLOOT-MAN" && vStatus === "KA" && vPageMode === "view") || (vUsrGrp === "VLOOT-MAN" && vStatus === "GA1" && vPageMode === "view")) {
                        protectHDRFields(formPanel, vStatus);
                    }
                },

                afterrecordchange: me.hdr_afterRecordChange,

                aftersaverecord: me.hdr_afterRecordChange

            },

            // end HDR

            '[extensibleFramework] [tabName=PAR]': {
                afterrender: function () {
                    var formPanel = this.getFormPanel();
                    var vUsrGrp = getUserGroup();
                    var fromHDRRequestData = EAM.Ajax.request({
                        url: 'PSPORD.HDR',
                        //params: b.values || g,
                        extraParams: {
                            'ordercode': formPanel.getFldValue("ordercode"),
                            'organization': formPanel.getFldValue("organization"),
                            'SYSTEM_FUNCTION_NAME': 'PSPORD',
                            'USER_FUNCTION_NAME': 'PSPORD',
                            'CURRENT_TAB_NAME': 'HDR',
                            'ONLY_DATA_REQUIRED': false
                        }
                    });
                    var vStatus = fromHDRRequestData.responseData.pageData.values.purchaseorderstatus.selected;
                    if ((vUsrGrp === "VLOOT-MAN" && vStatus === "KA") || (vUsrGrp === "VLOOT-MAN" && vStatus === "GA1")) {
                        protectPARFields(formPanel);
                    }
                },
                afterrecordchange: function () {
                    var formPanel = this.getFormPanel();
                    var vUsrGrp = getUserGroup();
                    var fromHDRRequestData = EAM.Ajax.request({
                        url: 'PSPORD.HDR',
                        //params: b.values || g,
                        extraParams: {
                            'ordercode': formPanel.getFldValue("ordercode"),
                            'organization': formPanel.getFldValue("organization"),
                            'SYSTEM_FUNCTION_NAME': 'PSPORD',
                            'USER_FUNCTION_NAME': 'PSPORD',
                            'CURRENT_TAB_NAME': 'HDR',
                            'ONLY_DATA_REQUIRED': false
                        }
                    });
                    var vStatus = fromHDRRequestData.responseData.pageData.values.purchaseorderstatus.selected;
                    EAM.Utils.debugMessage(vStatus);
                    if ((vUsrGrp === "VLOOT-MAN" && vStatus === "KA") || (vUsrGrp === "VLOOT-MAN" && vStatus === "GA1")) {
                        protectPARFields(formPanel);
                    }
                },
                afterreset: function () {
                    var formPanel = this.getFormPanel();
                    var vUsrGrp = getUserGroup();
                    var fromHDRRequestData = EAM.Ajax.request({
                        url: 'PSPORD.HDR',
                        //params: b.values || g,
                        extraParams: {
                            'ordercode': formPanel.getFldValue("ordercode"),
                            'organization': formPanel.getFldValue("organization"),
                            'SYSTEM_FUNCTION_NAME': 'PSPORD',
                            'USER_FUNCTION_NAME': 'PSPORD',
                            'CURRENT_TAB_NAME': 'HDR',
                            'ONLY_DATA_REQUIRED': false
                        }
                    });
                    var vStatus = fromHDRRequestData.responseData.pageData.values.purchaseorderstatus.selected;
                    if ((vUsrGrp === "VLOOT-MAN" && vStatus === "KA") || (vUsrGrp === "VLOOT-MAN" && vStatus === "GA1")) {
                        protectPARFields(formPanel);
                    }
                },
                afterloadrecord: function () {
                    var formPanel = this.getFormPanel();
                    var vUsrGrp = getUserGroup();
                    var fromHDRRequestData = EAM.Ajax.request({
                        url: 'PSPORD.HDR',
                        //params: b.values || g,
                        extraParams: {
                            'ordercode': formPanel.getFldValue("ordercode"),
                            'organization': formPanel.getFldValue("organization"),
                            'SYSTEM_FUNCTION_NAME': 'PSPORD',
                            'USER_FUNCTION_NAME': 'PSPORD',
                            'CURRENT_TAB_NAME': 'HDR',
                            'ONLY_DATA_REQUIRED': false
                        }
                    });
                    var vStatus = fromHDRRequestData.responseData.pageData.values.purchaseorderstatus.selected;
                    if ((vUsrGrp === "VLOOT-MAN" && vStatus === "KA") || (vUsrGrp === "VLOOT-MAN" && vStatus === "GA1")) {
                        protectPARFields(formPanel);
                    }
                }
            },
            '[extensibleFramework] [tabName=ACT]': {
                afterrender: function () {
                    var formPanel = this.getFormPanel();
                    var vUsrGrp = getUserGroup();
                    var fromHDRRequestData = EAM.Ajax.request({
                        url: 'PSPORD.HDR',
                        //params: b.values || g,
                        extraParams: {
                            'ordercode': formPanel.getFldValue("ordercode"),
                            'organization': formPanel.getFldValue("organization"),
                            'SYSTEM_FUNCTION_NAME': 'PSPORD',
                            'USER_FUNCTION_NAME': 'PSPORD',
                            'CURRENT_TAB_NAME': 'HDR',
                            'ONLY_DATA_REQUIRED': false
                        }
                    });
                    var vStatus = fromHDRRequestData.responseData.pageData.values.purchaseorderstatus.selected;
                    if ((vUsrGrp === "VLOOT-MAN" && vStatus === "KA") ||
                        //(vUsrGrp === "VLOOT-MAN" && vStatus === "GA")||
                        (vUsrGrp === "VLOOT-MAN" && vStatus === "GA1")) {
                        protectSRVFields(formPanel);
                    }
                },
                afterrecordchange: function () {
                    var formPanel = this.getFormPanel();
                    var vUsrGrp = getUserGroup();
                    var fromHDRRequestData = EAM.Ajax.request({
                        url: 'PSPORD.HDR',
                        //params: b.values || g,
                        extraParams: {
                            'ordercode': formPanel.getFldValue("ordercode"),
                            'organization': formPanel.getFldValue("organization"),
                            'SYSTEM_FUNCTION_NAME': 'PSPORD',
                            'USER_FUNCTION_NAME': 'PSPORD',
                            'CURRENT_TAB_NAME': 'HDR',
                            'ONLY_DATA_REQUIRED': false
                        }
                    });
                    var vStatus = fromHDRRequestData.responseData.pageData.values.purchaseorderstatus.selected;
                    if ((vUsrGrp === "VLOOT-MAN" && vStatus === "KA") ||
                        //(vUsrGrp === "VLOOT-MAN" && vStatus === "GA")||
                        (vUsrGrp === "VLOOT-MAN" && vStatus === "GA1")) {
                        protectSRVFields(formPanel);
                    }
                },
                afterreset: function () {
                    var formPanel = this.getFormPanel();
                    var vUsrGrp = getUserGroup();
                    var fromHDRRequestData = EAM.Ajax.request({
                        url: 'PSPORD.HDR',
                        //params: b.values || g,
                        extraParams: {
                            'ordercode': formPanel.getFldValue("ordercode"),
                            'organization': formPanel.getFldValue("organization"),
                            'SYSTEM_FUNCTION_NAME': 'PSPORD',
                            'USER_FUNCTION_NAME': 'PSPORD',
                            'CURRENT_TAB_NAME': 'HDR',
                            'ONLY_DATA_REQUIRED': false
                        }
                    });
                    var vStatus = fromHDRRequestData.responseData.pageData.values.purchaseorderstatus.selected;
                    if ((vUsrGrp === "VLOOT-MAN" && vStatus === "KA") ||
                        //(vUsrGrp === "VLOOT-MAN" && vStatus === "GA")||
                        (vUsrGrp === "VLOOT-MAN" && vStatus === "GA1")) {
                        protectSRVFields(formPanel);
                    }
                },
                afterloadrecord: function () {
                    var formPanel = this.getFormPanel();
                    var vUsrGrp = getUserGroup();
                    var fromHDRRequestData = EAM.Ajax.request({
                        url: 'PSPORD.HDR',
                        //params: b.values || g,
                        extraParams: {
                            'ordercode': formPanel.getFldValue("ordercode"),
                            'organization': formPanel.getFldValue("organization"),
                            'SYSTEM_FUNCTION_NAME': 'PSPORD',
                            'USER_FUNCTION_NAME': 'PSPORD',
                            'CURRENT_TAB_NAME': 'HDR',
                            'ONLY_DATA_REQUIRED': false
                        }
                    });
                    var vStatus = fromHDRRequestData.responseData.pageData.values.purchaseorderstatus.selected;
                    if ((vUsrGrp === "VLOOT-MAN" && vStatus === "KA") ||
                        //(vUsrGrp === "VLOOT-MAN" && vStatus === "GA")||
                        (vUsrGrp === "VLOOT-MAN" && vStatus === "GA1")) {
                        protectSRVFields(formPanel);
                    }
                }
            }

        } // end return
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

    hdr_afterRecordChange: function () {
        EAM.Utils.debugMessage('afterrecordchange function called !');
        var me = this,
        vFormPanel = this.getFormPanel();

        var vPageMode = vFormPanel.getFldValue("pagemode");
        var vUsrGrp = getUserGroup();
        var vStatus = vFormPanel.getFldValue("purchaseorderstatus");
        if ((vUsrGrp === "VLOOT-MAN" && vStatus === "KA" && vPageMode === "view") || (vUsrGrp === "VLOOT-MAN" && vStatus === "GA1" && vPageMode === "view")) {
            protectHDRFields(vFormPanel, vStatus);
        }

    },

}); //Ext.define


function protectHDRFields(formPanel, statusPO) {
    var vFld = "";
    vFld = {
        "storecode": "protected",
        "originatorcode": "protected",
        "duedate": "protected",
        "buyercode": "protected",
        "deliveryaddresscode": "protected",
        "class": "protected",
        "packagetrackingnumber": "protected",
        "suppliercode": "protected",
        "currency": "protected",
        "exchangerate": "protected",
        "defaultapprovercode": "protected",
        "organization": "protected",
        "udfchar01": "protected",
        "udfchar02": "protected",
        "udfchar03": "protected",
        "shipvia": "protected",
        "paymentterms": "protected",
        "freightterms": "protected",
        "fobpoint": "protected",
        "paybymethod": "protected",
        "creditcard_disp": "protected"
    }
    EAM.Builder.setFieldState(vFld, formPanel.getForm().getFields());
    var vFld2 = "";
    if (statusPO == "KA") {
        vFld2 = {
            "description": "optional"
        }
    } else {
        vFld2 = {
            "description": "protected"
        }
    }
    EAM.Builder.setFieldState(vFld2, formPanel.getForm().getFields());
};
function protectPARFields(formPanel) {
    var vFld = "";
    Ext.ComponentQuery.query("#createpart")[0].setDisabled(true);
    Ext.ComponentQuery.query("#addeditcomments")[0].setDisabled(true);
    Ext.ComponentQuery.query("#editpartdescription")[0].setDisabled(true);
    Ext.ComponentQuery.query("#selectparts")[0].setDisabled(true);
    Ext.ComponentQuery.query("#selectsuppliercatalogparts")[0].setDisabled(true);
    Ext.ComponentQuery.query("#extrachargediscount")[0].setDisabled(true);
    Ext.ComponentQuery.query("#ipaddparts")[0].setDisabled(true);
    Ext.ComponentQuery.query("#ipupdatebuyitems")[0].setDisabled(true);
    Ext.ComponentQuery.query("#ipviewsyncerr")[0].setDisabled(true);
    Ext.ComponentQuery.query("#substitutepart")[0].setDisabled(true);
    formPanel.up("[screen]").down("button[action=deleteRec]").setDisabled(true);
    formPanel.up("[screen]").down("button[action=newRec]").setDisabled(true);
    formPanel.up("[screen]").down("button[action=saveRec]").setDisabled(true);
    formPanel.up("[screen]").down("button[action=clearRec]").setDisabled(true);
    vFld = {
        "partcode": "protected",
        "partdesc": "protected",
        "polinetype": "protected",
        "quantity": "protected",
        "uom": "protected",
        "partqty": "protected",
        "partuom": "protected",
        "price": "protected",
        "currency": "protected",
        "workorder": "protected",
        "activity": "protected",
        "jobsequence": "protected",
        "taxcode": "protected",
        "polinestatus": "protected",
        "conditioncode": "protected",
        "conversionfactor": "protected",
        "duedate": "protected",
        "packagetrackingnumber": "protected",
        "udfchar01": "protected",
        "udfchar02": "protected",
        "udfchar03": "protected",
        "udfchar04": "protected",
        "udfchar05": "protected",
        "comments": "protected"
    }
    EAM.Builder.setFieldState(vFld, formPanel.getForm().getFields());
};
function protectSRVFields(formPanel) {
    var vFld = "";
    Ext.ComponentQuery.query("#addeditcomments")[0].setDisabled(true);
    Ext.ComponentQuery.query("#createworkorderactivity")[0].setDisabled(true);
    formPanel.up("[screen]").down("button[action=deleteRec]").setDisabled(true);
    formPanel.up("[screen]").down("button[action=newRec]").setDisabled(true);
    formPanel.up("[screen]").down("button[action=saveRec]").setDisabled(true);
    formPanel.up("[screen]").down("button[action=clearRec]").setDisabled(true);
    vFld = {
        "linetype": "protected",
        "linestatus": "protected",
        "requisitioncode": "protected",
        "requisitionline": "protected",
        "workordercode": "protected",
        "activity": "protected",
        "jobsequence": "protected",
        "tradecode": "protected",
        "taskcode": "protected",
        "jobplan": "protected",
        "hoursrequested": "protected",
        "price": "protected",
        "currencycode": "protected",
        "duedate": "protected",
        "taxcode": "protected",
        "freezerate": "protected",
        "comments": "protected"
    }
    EAM.Builder.setFieldState(vFld, formPanel.getForm().getFields());
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
        USER_FUNCTION_NAME: "NUUGRP",
        SYSTEM_FUNCTION_NAME: "BSUDSC",
        COMPONENT_INFO_TYPE: "DATA_ONLY"
    };

    var response = EAM.Ajax.request({
        url: "LOVPOP",
        params: requestData
    });
    return response.responseData.pageData.grid.GRIDRESULT.GRID.DATA[0].usrgroup;
};
