const plusRotation = () => {
  const plusBtn = document.querySelector('.fa-plus');
  console.log(plusBtn)
  plusBtn.addEventListener('mouseover', (event) => {
      plusBtn.classList.toggle('rotate');
      setTimeout(function(){ plusBtn.classList.remove('rotate'); } , 600);
  });
};

export { plusRotation };

