/*

Ext Gantt 2.2.25
Copyright(c) 2009-2014 Bryntum AB
http://bryntum.com/contact
http://bryntum.com/license

*/
/*

Ext Gantt 2.2.6
Copyright(c) 2009-2013 Bryntum AB
http://bryntum.com/contact
http://bryntum.com/license

*/
Ext.define('Gnt.locale.It', {
    extend      : 'Sch.locale.Locale',
    requires    : 'Sch.locale.It',
    singleton   : true,

    constructor : function (config) {

        Ext.apply(this, {
            l10n        : {
                'Gnt.util.DurationParser' : {
                    unitsRegex : {
                        MILLI       : /^ms$|^mil/i,
                        SECOND      : /^s$|^sec/i,
                        MINUTE      : /^m$|^min/i,
                        HOUR        : /^o$|^ora|^ore/i,
                        DAY         : /^g$|^giorn/i,
                        WEEK        : /^sett$|^settiman/i,
                        MONTH       : /^mese|^mesi/i,
                        QUARTER     : /^q$|^quar|^quadrimestr/i,
                        YEAR        : /^a$|^an|^anno/i
                    }
                },

                'Gnt.util.DependencyParser' : {
                    typeText    : {
                        SS  : 'II',
                        SF  : 'IF',
                        FS  : 'FI',
                        FF  : 'FF'
                    }
                },

                'Gnt.field.Duration' : {
                    invalidText : 'Valore durata non valido'
                },

                'Gnt.field.Effort' : {
                    invalidText : 'Valore impegno non valido'
                },

                'Gnt.field.Percent' : {
                    invalidText : 'Valore percentuale non valido'
                },

                'Gnt.feature.DependencyDragDrop' : {
                    fromText    : 'Da',
                    toText      : 'A',
                    startText   : 'Inizio',
                    endText     : 'Fine'
                },

                'Gnt.Tooltip' : {
                    startText       : 'Inizio: ',
                    endText         : 'Fine: ',
                    durationText    : 'Durata: '
                },

                'Gnt.plugin.TaskContextMenu' : {
                    taskInformation     : 'Informazioni Attività...',
                    newTaskText         : 'Nuova attività',
                    deleteTask          : 'Elimina attività',
                    editLeftLabel       : 'Modifica etichetta sinistra',
                    editRightLabel      : 'Modifica etichetta destra',
                    add                 : 'Aggiungi...',
                    deleteDependency    : 'Elimina dipendenza...',
                    addTaskAbove        : 'Attività precedente',
                    addTaskBelow        : 'Attività seguente',
                    addMilestone        : 'Milestone',
                    addSubtask          : 'Sotto-attività',
                    addSuccessor        : 'Successore',
                    addPredecessor      : 'Predecessore',
                    convertToMilestone  : 'Converti in milestone',
                    convertToRegular    : 'Conferti in attività normale'
                },

                'Gnt.plugin.DependencyEditor' : {
                    fromText            : 'Da',
                    toText              : 'A',
                    typeText            : 'Tipo',
                    lagText             : 'Lag',
                    endToStartText      : 'Fine-a-Inizio',
                    startToStartText    : 'Inizio-a-Inizio',
                    endToEndText        : 'Fine-a-Fine',
                    startToEndText      : 'Inizio-a-Fine'
                },

                'Gnt.widget.calendar.Calendar' : {
                    dayOverrideNameHeaderText : 'Nome',
                    overrideName        : 'Nome',
                    startDate           : 'Data Inizio',
                    endDate             : 'Data Fine',
                    error               : 'Errore',
                    dateText            : 'Data',
                    addText             : 'Aggiungi',
                    editText            : 'Modifica',
                    removeText          : 'Rimuovi',
                    workingDayText      : 'Giorni Lavorativi',
                    weekendsText        : 'Fine Settimana',
                    overriddenDayText   : 'Giorno escluso',
                    overriddenWeekText  : 'Settimana esclusa',
                    workingTimeText     : 'Orario lavorativo',
                    nonworkingTimeText  : 'Orario non lavorativo',
                    dayOverridesText    : 'Giorno escluso',
                    weekOverridesText   : 'Settimana esclusa',
                    okText              : 'OK',
                    cancelText          : 'Annulla',
                    parentCalendarText  : 'Calendario parente',
                    noParentText        : 'Nessun parente',
                    selectParentText    : 'Seleziona parente',
                    newDayName          : '[Senza nome]',
                    calendarNameText    : 'Nome Calendario',
                    tplTexts            : {
                        tplWorkingHours : 'Ore lavorative per',
                        tplIsNonWorking : 'è non lavorativa',
                        tplOverride     : 'bypassa',
                        tplInCalendar   : 'in calendario',
                        tplDayInCalendar: 'giorno standard in calendario',
                        tplBasedOn      : 'Basata su'
                    },
                    overrideErrorText   : 'C\'è già un override per questo giorno',
                    overrideDateError   : 'C\'è già un override di settimana per questa data: {0}',
                    startAfterEndError  : 'La data di inizio deve essere precedente a quella di fine',
                    weeksIntersectError : 'L\'override di settimana non deve intersecarsi'
                },

                'Gnt.widget.calendar.AvailabilityGrid' : {
                    startText           : 'Inizio',
                    endText             : 'Fine',
                    addText             : 'Aggiungi',
                    removeText          : 'Rimuovi',
                    error               : 'Errore'
                },

                'Gnt.widget.calendar.DayEditor' : {
                    workingTimeText    : 'Tempo lavorativo',
                    nonworkingTimeText : 'Tempo non-lavorativo'
                },

                'Gnt.widget.calendar.WeekEditor' : {
                    defaultTimeText    : 'Tempo predefinito',
                    workingTimeText    : 'Tempo lavorativo',
                    nonworkingTimeText : 'Tempo non-lavorativo',
                    error              : 'Errore',
                    noOverrideError    : "L\'override settimanale contiene solo giorni 'predefiniti' - non posso salvarlo"
                },

                'Gnt.widget.calendar.ResourceCalendarGrid' : {
                    name        : 'Nome',
                    calendar    : 'Calendario'
                },

                'Gnt.widget.calendar.CalendarWindow' : {
                    ok      : 'Ok',
                    cancel  : 'Annulla'
                },

                'Gnt.field.Assignment' : {
                    cancelText : 'Annulla',
                    closeText  : 'Salva e Chiudi'
                },

                'Gnt.column.AssignmentUnits' : {
                    text : 'Unità'
                },

                'Gnt.column.Duration' : {
                    text : 'Durata'
                },

                'Gnt.column.Effort' : {
                    text : 'Impegno'
                },

                'Gnt.column.EndDate' : {
                    text : 'Fine'
                },

                'Gnt.column.PercentDone' : {
                    text : '% Svolta'
                },

                'Gnt.column.ResourceAssignment' : {
                    text : 'Risorse Assegnate'
                },

                'Gnt.column.ResourceName' : {
                    text : 'Nome Risorsa'
                },

                'Gnt.column.Rollup' : {
                    text : 'Crollo',
                    yes  : 'Si',
                    no   : 'No'
                },

                'Gnt.column.SchedulingMode' : {
                    text : 'Modalità'
                },

                'Gnt.column.Predecessor' : {
                    text : 'Predecessore'
                },

                'Gnt.column.Successor' : {
                    text : 'Successore'
                },

                'Gnt.column.StartDate' : {
                    text : 'Inizio'
                },

                'Gnt.column.WBS' : {
                    text : '#'
                },

                'Gnt.column.Sequence' : {
                    text : '#'
                },

                'Gnt.column.Calendar' : {
                    text : 'Calendario'
                },

                'Gnt.widget.taskeditor.TaskForm' : {
                    taskNameText            : 'Nome',
                    durationText            : 'Durata',
                    datesText               : 'Date',
                    baselineText            : 'Riferimento',
                    startText               : 'Inizio',
                    finishText              : 'Fine',
                    percentDoneText         : 'Percentuale Completamento',
                    baselineStartText       : 'Inizio',
                    baselineFinishText      : 'Fine',
                    baselinePercentDoneText : 'Percentuale Completamento',
                    effortText              : 'Impegno',
                    invalidEffortText       : 'Valore impegno non valido',
                    calendarText            : 'Calendario',
                    schedulingModeText      : 'Modalità schedulazione',
                    rollupText              : 'Rollup'
                },

                'Gnt.widget.DependencyGrid' : {
                    idText                      : 'ID',
                    snText                      : 'SN',
                    taskText                    : 'Nome attività',
                    blankTaskText               : 'Selezionare attività',
                    invalidDependencyText       : 'Dipendenza non valida',
                    parentChildDependencyText   : 'Trovata dipendenza tra figlio e parente',
                    duplicatingDependencyText   : 'Trovata duplicazione dipendenza',
                    transitiveDependencyText    : 'Dipendenza transitiva',
                    cyclicDependencyText        : 'Dipendenza ciclica',
                    typeText                    : 'Tipo',
                    lagText                     : 'Lag',
                    clsText                     : 'Classe CSS',
                    endToStartText              : 'Fine-a-Inizio',
                    startToStartText            : 'Inizio-a-Inizio',
                    endToEndText                : 'Fine-a-Fine',
                    startToEndText              : 'Inizio-a-Fine'
                },

                'Gnt.widget.AssignmentEditGrid' : {
                    confirmAddResourceTitle : 'Conferma',
                    confirmAddResourceText  : 'Nessuna risorsa &quot;{0}&quot; nell\'archivio al momento. Desideri aggiungerla?',
                    noValueText             : 'Seleziona una risorsa da assegnare',
                    noResourceText          : 'Nessuna risorsa &quot;{0}&quot; in archivio'
                },

                'Gnt.widget.taskeditor.TaskEditor' : {
                    generalText         : 'Generale',
                    resourcesText       : 'Risorse',
                    dependencyText      : 'Predecessori',
                    addDependencyText   : 'Aggiungi nuova',
                    dropDependencyText  : 'Elimina',
                    notesText           : 'Note',
                    advancedText        : 'Avanzate',
                    wbsCodeText         : 'Codice WBS',
                    addAssignmentText   : 'Aggiungi nuova',
                    dropAssignmentText  : 'Elimina'
                },

                'Gnt.plugin.TaskEditor' : {
                    title           : 'Informazioni Attività',
                    alertCaption    : 'Informazioni',
                    alertText       : 'Correggi gli errori marcati per salvare i cambiamenti',
                    okText          : 'Ok',
                    cancelText      : 'Annulla'
                },

                'Gnt.field.EndDate' : {
                    endBeforeStartText : 'La data di fine è precedente a quella di inizio'
                },

                'Gnt.column.Note'   : {
                    text            : 'Note'
                },

                'Gnt.column.AddNew' : {
                    text            : 'Aggiungi nuova colonna...'
                },

                'Gnt.column.EarlyStartDate' : {
                    text            : 'Inizio Anticipato'
                },

                'Gnt.column.EarlyEndDate' : {
                    text            : 'Fine Anticipata'
                },

                'Gnt.column.LateStartDate' : {
                    text            : 'Inizio Ritardato'
                },

                'Gnt.column.LateEndDate' : {
                    text            : 'Fine Ritardata'
                },

                'Gnt.field.Calendar' : {
                    calendarNotApplicable : 'Il calendario attività non ha sovrapposizioni con il calendario delle risorse assegnate'
                },

                'Gnt.column.Slack' : {
                    text            : 'Lasco'
                },


                'Gnt.column.Name'   : {
                    text            : 'Nome Attività'
                },

                'Gnt.column.BaselineStartDate'   : {
                    text            : 'Data Inizio Riferimento'
                },

                'Gnt.column.BaselineEndDate'   : {
                    text            : 'Data Fine Riferimento'
                },

                'Gnt.column.Milestone'   : {
                    text            : 'Milestone'
                },

                'Gnt.field.Milestone'   : {
                    yes             : 'Si',
                    no              : 'No'
                },

                'Gnt.field.Dependency'  : {
                    invalidFormatText       : 'Invalid dependency format',
                    invalidDependencyText   : 'Invalid dependency found, please make sure you have no cyclic paths between your tasks and this type of dependency is allowed',
                    invalidDependencyType   : 'Invalid dependency type {0}. Allowed values are: {1}.'
                }
            }
        });

        this.callParent(arguments);
    }
});
