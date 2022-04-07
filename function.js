/**
 * mostra/nascondi elementi con bottone
 * Si assume che gli id in arrivo abbiamo un elemento - come separatore
 * @param {*} event 
 */
function mostraInfo(event) {

    var { target } = event;
    var buttonId = target.getAttribute('id');

    if (buttonId && buttonId.includes('-')) {
        var textId = 'text-' + buttonId.split('-')[1];
        var element = document.getElementById(textId); //id qui dentro per nascondere l'elemento giusto
        element.classList.toggle('isHidden');
    }
}

/**
 * mostra/nascondi elementi con bottone dei tooltip
 * A differenza del metodo mostra info, gli id in arrivo non contengono il simbolo - come separatore
 * @param {*} event 
 */
function mostraInfoTooltip(event) {

    var { target } = event;
    var polygonId = target.getAttribute('id');

    if (polygonId) {

        var tooltipInfoId = 'text-' + polygonId;
        var tooltipInfo = document.getElementById(tooltipInfoId);

        // prima di mostrare il tooltip, mi preoccupo di nascondere evetuali tooltip precedenti
        var actualShownTooltip = $(tooltipInfo.parentNode).children(':visible');

         if (actualShownTooltip) {
            actualShownTooltip.addClass('isHidden');
         }

        // mostro il tooltip relativo al polygon che ho cliccato
        $(tooltipInfo).removeClass('isHidden');
    }
}

function evidenziaRiga(event) {

    var { target } = event;
    var polygonId = target.getAttribute('id');

    if (polygonId) {

        var fraseInfoId = 'text-' + polygonId;
        var fraseInfo = document.getElementById(fraseInfoId);

        // mostro il tooltip relativo al polygon che ho cliccato
        $(fraseInfo).addClass('highlight');
    }
}

function togliEvidenziazioneRiga(event) {

    var { target } = event;
    var polygonId = target.getAttribute('id');

    if (polygonId) {

        var fraseInfoId = 'text-' + polygonId;
        var fraseInfo = document.getElementById(fraseInfoId);

        // mostro il tooltip relativo al polygon che ho cliccato
        $(fraseInfo).removeClass('highlight');
    }
}