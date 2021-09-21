$(document).ready(function () {
    searchSelect2('#search_nature');
    searchSelect2('#search_status');
});

var select2arrayoflanguage = {
    matches: function (matches) {
        return matches + " Varios resultados encontrados. Use las flechas para seleccionar.";
    },
    noResults: function () {
        return "No se han encontrado registros";
    },
    inputTooShort: function (input) {
        var n = input.minimum;
        /*console.log(input);
        console.log(input.minimum);*/
        if (n > 1) return "Introducir " + n + " o más caracteres";
        else return "Introducir " + n + " o más caracteres"
    },
    loadMore: function (pageNumber) {
        return "Cargando más resultados...";
    },
    searching: function () {
        return "Búsqueda en progreso...";
    }
};

function searchSelect2(search_field) {
    <!-- Set focus onto a specific field -->
    $("#search_keyword").focus();
    $(search_field).select2({
        dir: 'ltr',
        width: 'resolve',		/* off or resolve */
        minimumInputLength: 0,
        language: select2arrayoflanguage,
        containerCssClass: ':all:',					/* Line to add class of origin SELECT propagated to the new <span class="select2-selection...> tag */
        selectionCssClass: ':all:',					/* Line to add class of origin SELECT propagated to the new <span class="select2-selection...> tag */
        templateResult: function (data, container) {	/* Format visible output into combo list */
            /* Code to add class of origin OPTION propagated to the new select2 <li> tag */
            if (data.element) {
                $(container).addClass($(data.element).attr("class"));
            }
            //console.log($(data.element).attr("data-html"));
            if (data.id == -1 && $(data.element).attr("data-html") == undefined) {
                return '&nbsp;';
            }
            if ($(data.element).attr("data-html") != undefined) return htmlEntityDecodeJs($(data.element).attr("data-html"));		// If property html set, we decode html entities and use this
            return data.text;
        },
        templateSelection: function (selection) {		/* Format visible output of selected value */
            if (selection.id == -1) return '<span class="placeholder">' + selection.text + '</span>';
            return selection.text;
        },
        escapeMarkup: function (markup) {
            return markup;
        },
        dropdownCssClass: 'ui-dialog'
    });
}
