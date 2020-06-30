const showInput = () => {
  const form = document.getElementById('new-mail');
  const pens = document.querySelectorAll('.update-pen');
    pens.forEach((pen) => {
      pen.addEventListener('click', (event) => {
        console.log(event);
        form.classList.toggle('d-none');
      })
    })
}

export { showInput };