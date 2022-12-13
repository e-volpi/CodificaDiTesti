//mostra la traduzione delle pagine 11a e 12
function trad(index){
    
    var traduzioni = document.getElementsByClassName("traduzione");
    traduzioni[index].classList.toggle("traduzione-display");
}

var bottoni = document.getElementsByClassName("bottoneTraduzione");



for(let i = 0; i<bottoni.length; i++) {
    bottoni[i].addEventListener("click", function(){
        trad(i);
    });
}

//mostra retro del foglio 11a
function retroPagina(){
    

    if(i === 0) {
        document.getElementById("containerFoto").setAttribute("src", "ms_fr_03951_01_2_p011v.jpg");
        i++;
    } else {
        document.getElementById("containerFoto").setAttribute("src", "ms_fr_03951_01_2_p011a_mili (1).png");
        i--;
    }

    
}

let i = 0;
document.getElementById("retro11a").addEventListener("click", retroPagina)

//mappatura immagine 
const area=document.querySelectorAll("area");
const b= document.querySelectorAll(".numero");

area.forEach(riga => {
    riga.addEventListener("click", () => {
        const verifica = `#${riga.attributes[2].value}`;
        b.forEach(numero=> {
            numero.style.backgroundColor = "inherit";
            numero.style.color = "inherit";

            if(numero.attributes[0].value === verifica){
                numero.style.backgroundColor = "#b59ad3a8";
                numero.style.color = "#fff";
            }
        })
    })
})

//seleziona cancellazioni
const cancellazioni = document.querySelector("#cancellazioni");
const del = document.querySelectorAll(".del");

cancellazioni.addEventListener("click", () => del.forEach(canc => canc.classList.toggle("line_through")));

//seleziona gap
const notReading = document.querySelector("#notReading"); 
const gap = document.querySelectorAll(".gap");

notReading.addEventListener("click", () => gap.forEach( pippo => pippo.classList.toggle("line_through")));

//seleziona aggiunte
const aggiunte = document.querySelector("#aggiunte");
const add = document.querySelectorAll(".add");

aggiunte.addEventListener("click", () => add.forEach(agg => agg.classList.toggle("lightblue")));

//seleziona correzioni
const correzioni = document.querySelector("#correzioni");
const sic = document.querySelectorAll(".sic");
const corr = document.querySelectorAll(".corr");

correzioni.addEventListener("click", () => {
    sic.forEach(originale => originale.classList.toggle("none"));
    corr.forEach(corretta => corretta.classList.toggle("inline_block"));
});

//seleziona abbreviazioni ed espansioni
const abbreviazioni = document.querySelector("#abbreviazioni");
const abbr = document.querySelectorAll(".abbr");
const expan = document.querySelectorAll(".expan");

abbreviazioni.addEventListener("click", () => {
    abbr.forEach(abbre => abbre.classList.toggle("inner_block"));
    expan.forEach(expans => expans.classList.toggle("inline_block"));
});

//seleziona termini
const termini = document.querySelector("#termini");
const term = document.querySelectorAll(".term");

termini.addEventListener("click", () => term.forEach(termine => termine.classList.toggle("magenta")));

//seleziona glottonimi
const glottonimi = document.querySelector("#glottonimi");
const lang = document.querySelectorAll(".lang");

glottonimi.addEventListener("click", () => lang.forEach(glu => glu.classList.toggle("purple")));

//seleziona esempio linguistico
const linguistico = document.querySelector("#linguistico");
const mentioned = document.querySelectorAll(".mentioned");

linguistico.addEventListener("click", () => mentioned.forEach(men => men.classList.toggle("orange")));

//seleziona date
const data = document.querySelector("#date"); 
const date = document.querySelectorAll(".date");

data.addEventListener("click", () => date.forEach (tempo => tempo.classList.toggle("light_coral")));

