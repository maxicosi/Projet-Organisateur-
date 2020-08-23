"use strict";

function ajoutUtilisateur(nom,prenom,mail,mdp){
    xhr = new XMLHttpRequest();
    xhr.open("get",`/ajouterUtilisateur?prenom=${prenom}$nom=${nom}$mail=${mail}&mdp=${mdp}`,true);
    xhr.onerror =
        function (){
            console.log("ERROR  --  status: " + this.status + ", readyState: " + this.readyState);
            // TODO AFFICHER MESSAGE D'ERREUR
        };
    xhr.onload =
        function () {
            let request = JSON.parse(this.responseText)[0];
            if (request.status == 201){
                document.getElementById("mailExisteDejaErreur").style.display= "none";
                document.getElementById("submitBtn").style.backgroundColor= "green";
                alert("Profile créé! Connectez-vous pour jouer.")
                closPopUps();
            }
            else if (request.status == 400){
                document.getElementById("mailInput").style.color= "red";
                document.getElementById("mailExisteDejaErreur").style.display= "block";
            }
        };
    xhr.send();
}
