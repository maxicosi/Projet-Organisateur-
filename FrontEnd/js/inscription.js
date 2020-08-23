let inscriptionForm;

document.addEventListener('DOMContentLoaded', function (){
    inscriptionForm = document.getElementById("InscriptionForm");
    inscriptionForm.addEventListener("submit", submitInscriptionForm);
});


function submitInscriptionForm(event) {
    event.preventDefault();
    let form = this;
    ajoutUtilisateur(form.nom.value,form.prenom.value,form.sexe.value,form.mail.value,form.pwd.value);
}
