/*
 * Function: Werkorders / WSJOBS
 * Spectades UpDocs
 * Spectades B.V.
 *
 * REV 001 - MLA - 20200318 - First creation
 * REV 002 - MLA - 20230510 - Changed multiorg to dynamic
 * REV 003 - MLA - 20230511 - Added BSIMPT.BDU intialization call to avoid upload error
 * REV 004 - MLA - 20230626 - Changed udfbutton to maintoolbar button (EAM 12 style)
 * REV 005 - MLA - 20230802 - Bug fix, maintoolbar button was created multiple times
 * REV 006 - MLA - 20230824 - Changed button iconcls for different EAM versions
 * REV 007 - MLA - 20231107 - Added close listener to refresh main screen
 * REV 008 - MLA - 20231107 - Bug fix: refresh could not be a function
 * REV 009 - MLA - 20240513 - Fix after EAM upgrade 12.1.1
 * 001 20-08-2024 - MCT 	- (SPC-573) Code updated for PRD environment
 * 002 20-08-2024 -	MCT 	- (SPC-573) Raise an error if UDFCHAR06 value is present and its type changes.
 */

var docMultiOrg = true;
var eamVersion = '';

Ext.define('EAM.custom.external_wsjobs', {
    extend: 'EAM.custom.AbstractExtensibleFramework',
    getSelectors: function () {
        var me = this;

        return {
            '[extensibleFramework] [tabURL=WSJOBS.LST]': {
                afterrender: function (f) {
                    if (!EAM.getApplication().designerMode) {
                        me.doAfterrender(f);
                    }
                }
            },
            '[extensibleFramework] [tabURL=WSJOBS.HDR]': {
                afterrender: function (f) {
                    if (!EAM.getApplication().designerMode) {
                        var formPanel = this.getFormPanel();
                        me.doAfterrender(f);
                        //maintainFormPanelState(formPanel);
                    }
                },
                afterrecordchange: function (f) {
                    if (!EAM.getApplication().designerMode) {
                        var formPanel = this.getFormPanel();
                        console.log('afterrecordchange HDR');
                        //maintainFormPanelState(formPanel);
                    }
                },
                aftersaverecord: function (f) {
                    if (!EAM.getApplication().designerMode) {
                        var formPanel = this.getFormPanel();
                        console.log('aftersaverecord HDR');
                        //maintainFormPanelState(formPanel);
                    }
                },
            },
            '[extensibleFramework] [tabName=HDR] uxcombobox[name=workordertype]': {
                select: function (a, b) {
                    try {
                        EAM.Utils.debugMessage('workordertype is select!!');
                        var formPanel = this.getFormPanel();
                        RaiseErrorType(formPanel, a.originalValue);
                        //maintainFormPanelState(formPanel);
                    } catch (err) {
                        EAM.Utils.debugMessage('workordertype select error' + err);
                    }
                }
            },
            // end HDR

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

    }
}); //Ext.define
function RaiseErrorType(formPanel, vOldValue) {
    try {
        console.log('RaiseErrorType () Called!!');
        var vUdfchar06 = formPanel.getFldValue('udfchar06');
        var userLang = EAM.AppData.getInstallParams().get("language");
        console.log('Login User Lang: ' + userLang);
        var vErrorMessage;
        if (userLang == 'EN') { //English
            vErrorMessage = 'We can not change job-type because this record is created by interface.';
        } else if (userLang == 'FI') { //Suomi
            vErrorMessage = 'We can not change job-type because this record is created by interface.';
        } else if (userLang == 'GE') { //Deutsch
            vErrorMessage = 'Het type mag niet gewijzigd worden omdat deze door de interface gecreëerd is.';
        } else if (userLang == 'NL') { //Nederlands
            vErrorMessage = 'Het type mag niet gewijzigd worden omdat deze door de interface gecreëerd is.';
        } else {}
        if (vUdfchar06 !== "") {
            EAM.Messaging.showError(vErrorMessage);
            // formPanel.setFldValue("workordertype", vOldValue);
            var resetButton = EAM.Utils.getMainToolbar().getResetButton();
            resetButton.fireEvent("click", resetButton);
            return false;
        }
        //maintainFormPanelState(formPanel);
    } catch (err) {
        console.log('RaiseErrorType() Error: ' + err);
    }
}
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
