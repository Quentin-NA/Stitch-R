const showInput = () => {
  const pens = document.querySelectorAll('.pen');
  pens.forEach((pen) => {
    pen.addEventListener('click', (event) => {  
      const par = pen.parentNode;
      const grandPar = par.parentNode;
      const chi = grandPar.children;
      console.log(chi);
      console.log(grandPar);
        chi[3].childNodes[3].classList.toggle('d-none');
        chi[3].childNodes[1].classList.toggle('d-none');
      })
    })
}


export { showInput };
