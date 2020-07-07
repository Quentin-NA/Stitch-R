const showInput = () => {
  const pens = document.querySelectorAll('.pen');
  pens.forEach((pen) => {
    pen.addEventListener('click', (event) => {  
      const par = pen.parentNode;
      const para = par.parentNode;
      const chi = para.children;
        console.log(para);
        console.log(chi);
        chi[3].childNodes[3].classList.toggle('d-none');
      })
    })
}


export { showInput };
