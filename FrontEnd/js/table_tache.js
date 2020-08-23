function recupTableTache() {
    let xhr = new XMLHttpRequest();

    xhr.open('get', '/tableTache', true);
    xhr.onload =
        function () {
            let tableTache = 'table_tache';
            creerTable(JSON.parse(this.responseText), tableTache);
        };
    xhr.send();
}

function creerTable(reponseRequete, idBodyTable) {

    let table = '<tbody><tr><th> Nom des taches </th><th> description des taches </th><th> accomplissement </th></tr>';

    for (let e of reponseRequete) {
        table += '<tr><td>' + e.nomTache + '</td><td>' + e.descriptionTache + '</td><td>' + e.accomplissementTache  + '</td></tr>';
    }
    table += "</tbody>";
    document.getElementById(idBodyTable).innerHTML = table ;
}