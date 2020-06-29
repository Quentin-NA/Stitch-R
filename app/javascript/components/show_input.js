const showInput = () => {
  const form = document.getElementById('new-mail');
  const pen = document.getElementById('update-pen');
      pen.addEventListener('click', (event) => {
        form.classList.toggle('d-none');
      })
}

export { showInput };