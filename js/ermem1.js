
function removeAllOptions(sel, removeGrp) {
    var len, groups, par;
    if (removeGrp) {
        groups = sel.getElementsByTagName('optgroup');
        len = groups.length;
        for (var i=len; i; i--) {
            sel.removeChild( groups[i-1] );
        }
    }

    len = sel.options.length;
    for (var i=len; i; i--) {
        par = sel.options[i-1].parentNode;
        par.removeChild( sel.options[i-1] );
    }
}

function appendDataToSelect(sel, obj) {
    var f = document.createDocumentFragment();
    var labels = [], group, opts;

    function addOptions(obj) {
        var f = document.createDocumentFragment();
        var o;

        for (var i=0, len=obj.text.length; i<len; i++) {
            o = document.createElement('option');
            o.appendChild( document.createTextNode( obj.text[i] ) );

            if ( obj.value ) {
                o.value = obj.value[i];
            }

            f.appendChild(o);
        }
        return f;
    }

    if ( obj.text ) {
        opts = addOptions(obj);
        f.appendChild(opts);
    } else {
        for ( var prop in obj ) {
            if ( obj.hasOwnProperty(prop) ) {
                labels.push(prop);
            }
        }

        for (var i=0, len=labels.length; i<len; i++) {
            group = document.createElement('optgroup');
            group.label = labels[i];
            f.appendChild(group);
            opts = addOptions(obj[ labels[i] ] );
            group.appendChild(opts);
        }
    }
    sel.appendChild(f);
}

// anonymous function assigned to onchange event of controlling select list
document.forms['demoForm'].elements['filiere'].onchange = function(e) {
    // name of associated select list
    var relName = 'choices[]';

    // reference to associated select list
    var relList = this.form.elements[ relName ];

    // get data from object literal based on selection in controlling select list (this.value)
    var obj = Select_List_Data[ relName ][ this.value ];

    // remove current option elements
    removeAllOptions(relList, true);

    // call function to add optgroup/option elements
    // pass reference to associated select list and data for new options
    appendDataToSelect(relList, obj);
};

// object literal holds data for optgroup/option elements
var Select_List_Data = {

    // name of associated select list
    'choices[]': {

        // names match option values in controlling select list
        gin: {

                text: ['GLO', 'RES/INT'],
                value: ['glo', 'res/int']

        },
        gbio: {

            text: ['IAB', 'ABB', 'GEN'],
            value: ['iab', 'abb', 'gen']
        },
        gim: {

                text: ['GTE', 'GEL', 'MIP', 'GMP'],
                value: ['gte', 'gel', 'mip', 'gmp']

        }
    }

};

// populate associated select list when page loads
window.onload = function() {
    var form = document.forms['demoForm'];

    // reference to controlling select list
    var sel = form.elements['filiere'];
    sel.selectedIndex = 0;

    // name of associated select list
    var relName = 'choices[]';
    // reference to associated select list
    var rel = form.elements[ relName ];

    // get data for associated select list passing its name
    // and value of selected in controlling select list
    var data = Select_List_Data[ relName ][ sel.value ];

    // add options to associated select list
    appendDataToSelect(rel, data);
};
