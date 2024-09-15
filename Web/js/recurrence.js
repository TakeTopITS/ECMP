/* Copyright © 2005 - 2012 Annpoint, s.r.o.
   Use of this software is subject to license terms. 
   http://www.daypilot.org/

*/

if (typeof(DayPilot) === 'undefined') {
    DayPilot = {};
}

DayPilot.Recurrence = function() {
    var t = this;

    t.divs = ["select_norepeat", "select_daily", "select_weekly", "select_monthly", "select_annually"];
    t.repeat = null;
    
    this.Init = function() {
        t.windowOnLoad = window.onload;
        window.onload = t.deferredInit;
    };
    
    this.deferredInit = function(a) {
        t.repeat = t.$("repeat");
        
        // load the config
        if (t.config.type) {
            t.repeat.value = t.config.type;
        }
        switch (t.config.type) {
            case "disabled":
                t.repeat.setAttribute("disabled", "disabled");
                t.repeat.value = "norepeat";
                break;
            case "daily":
                t.$("daily_every").value = t.config.every;
                break;
            case "weekly":
                t.$("weekly_every").value = t.config.every;
                for(var i = 0; i < t.config.days.length; i++) {
                    t.$("weekly_" + t.config.days[i]).checked = true;
                }
                break;
            case "monthly":
                t.$("monthly_every").value = t.config.every;
                for(var i = 0; i < t.config.days.length; i++) {
                    t.$("monthly_" + t.config.days[i]).checked = true;
                }
                break;
        }
        
        switch (t.config.range) {
            case "indefinitely":
                break;
            case "until":
                t.$("repeat_until_value").value = t.config.until;
                break;
            case "times":
                t.$("repeat_times_value").value = t.config.times;
                break;
            default:
                t.config.range = "indefinitely";
                break;
        }
        t.$("repeat_" + t.config.range).checked = true;
        
        t.repeat.onchange = t.changed;
        t.changed(); // update visibility
        
        // hook the submission
        t.$(t.saveButtonId).onclick = function() {
            var result = {};
            var errors = []; // IDs of error messages to be displayed
            result.type = t.repeat.value;
            switch (result.type) {
                case "weekly":
                    result.days = [];
                    for(var i = 0; i < 7; i++) {
                        if (t.$("weekly_" + i).checked) {
                            result.days.push(i);
                        }
                    }
                    if (result.days.length === 0) {
                        errors.push("select_weekly_error");
                    }
                    break;
                case "monthly":
                    result.days = [];
                    for(var i = 1; i <= 31; i++) {
                        if (t.$("monthly_" + i).checked) {
                            result.days.push(i);
                        }
                    }
                    if (result.days.length === 0) {
                        errors.push("select_monthly_error");
                    }
                    break;
            }
            result.every = t.$(result.type + "_every") ? t.$(result.type + "_every").value : null;
            
            if (t.$("repeat_indefinitely").checked) {
                result.range = "indefinitely";
            }
            else if (t.$("repeat_until").checked) {
                result.range = "until";
                result.until = t.$("repeat_until_value").value;
            }
            else if (t.$("repeat_times").checked) {
                result.range = "times";
                result.times = t.$("repeat_times_value").value;
            }

            t.$(t.jsonHiddenId).value = DayPilot.JSON.stringify(result);
            //alert("serialized:" + t.$(t.jsonHiddenId).value);
            
            if (errors.length > 0) {
                for(var i = 0; i < errors.length; i++) {
                    t.$(errors[i]).style.display = '';
                }
                return false;  // cancel submitting
            }
        };    
        
        if (t.windowOnLoad) {
            t.windowOnLoad(a);
        }
    };
    
    this.$ = function(id) {
        return document.getElementById(id);
    };
    
    this.changed = function(e) {
        var id = t.$("repeat").value;
        if (!id) { id = "norepeat";}
        t.show("select_" + id);
    };
    
    this.show = function(id) {
        for (var i = 0; i < t.divs.length; i++) {
            if (t.divs[i] === id) {
                t.$(id).style.display = '';
            }
            else {
                if (t.$(t.divs[i])) {
                    t.$(t.divs[i]).style.display = 'none';
                }
            }
        }
        if (id && id != 'select_norepeat') {
            t.$("range").style.display = '';
        }
        else {
            t.$("range").style.display = 'none';
        }
    };
    
    
};

if (typeof DayPilot.JSON === 'undefined') {
    DayPilot.JSON = {};

    (function () {
        function f(n) {
            return n < 10 ? '0' + n : n;
        }

        if (typeof Date.prototype.toJSON2 !== 'function') {

            Date.prototype.toJSON2 = function (key) {
                return this.getUTCFullYear()   + '-' +
                             f(this.getUTCMonth() + 1) + '-' +
                             f(this.getUTCDate())      + 'T' +
                             f(this.getUTCHours())     + ':' +
                             f(this.getUTCMinutes())   + ':' +
                             f(this.getUTCSeconds())   + '';
            };

            String.prototype.toJSON =
            Number.prototype.toJSON =
            Boolean.prototype.toJSON = function (key) {
                return this.valueOf();
            };
        }

        var cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
            escapeable = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,
            gap,
            indent,
            meta = {    
                '\b': '\\b',
                '\t': '\\t',
                '\n': '\\n',
                '\f': '\\f',
                '\r': '\\r',
                '"' : '\\"',
                '\\': '\\\\'
            },
            rep;

        function quote(string) {
            escapeable.lastIndex = 0;
            return escapeable.test(string) ?
                '"' + string.replace(escapeable, function (a) {
                    var c = meta[a];
                    if (typeof c === 'string') {
                        return c;
                    }
                    return '\\u' + ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
                }) + '"' :
                '"' + string + '"';
        }

        function str(key, holder) {
            var i,          
                k,          
                v,          
                length,
                mind = gap,
                partial,
                value = holder[key];
            if (value && typeof value === 'object' && typeof value.toJSON2 === 'function') {
                value = value.toJSON2(key);
            }
            else if (value && typeof value === 'object' && typeof value.toJSON === 'function' && !value.ignoreToJSON) {
                value = value.toJSON(key);
            }
            if (typeof rep === 'function') {
                value = rep.call(holder, key, value);
            }
            switch (typeof value) {
            case 'string':
                return quote(value);
            case 'number':
                return isFinite(value) ? String(value) : 'null';
            case 'boolean':
            case 'null':
                return String(value);
            case 'object':
                if (!value) {
                    return 'null';
                }
                gap += indent;
                partial = [];
                if (typeof value.length === 'number' &&
                        !value.propertyIsEnumerable('length')) {
                    length = value.length;
                    for (i = 0; i < length; i += 1) {
                        partial[i] = str(i, value) || 'null';
                    }
                    v = partial.length === 0 ? '[]' :
                        gap ? '[\n' + gap +
                                partial.join(',\n' + gap) + '\n' +
                                    mind + ']' :
                              '[' + partial.join(',') + ']';
                    gap = mind;
                    return v;
                }
                if (rep && typeof rep === 'object') {
                    length = rep.length;
                    for (i = 0; i < length; i += 1) {
                        k = rep[i];
                        if (typeof k === 'string') {
                            v = str(k, value);
                            if (v) {
                                partial.push(quote(k) + (gap ? ': ' : ':') + v);
                            }
                        }
                    }
                } else {
                    for (k in value) {
                        if (Object.hasOwnProperty.call(value, k)) {
                            v = str(k, value);
                            if (v) {
                                partial.push(quote(k) + (gap ? ': ' : ':') + v);
                            }
                        }
                    }
                }
                v = (partial.length === 0) ? '{\u007D' :
                    gap ? '{\n' + gap + partial.join(',\n' + gap) + '\n' +
                            mind + '\u007D' : '{' + partial.join(',') + '\u007D';
                gap = mind;
                return v;
            }
        }

        if (typeof DayPilot.JSON.stringify !== 'function') {
            DayPilot.JSON.stringify = function (value, replacer, space) {
                var i;
                gap = '';
                indent = '';
                if (typeof space === 'number') {
                    for (i = 0; i < space; i += 1) {
                        indent += ' ';
                    }
                } else if (typeof space === 'string') {
                    indent = space;
                }
                rep = replacer;
                if (replacer && typeof replacer !== 'function' && (typeof replacer !== 'object' || typeof replacer.length !== 'number')) {
                    throw new Error('JSON.stringify');
                }
                return str('', {'': value});
            };
        }

    })();
}