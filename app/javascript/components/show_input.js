const showInput = () => {
  const form = document.getElementById('new-mail');
  const partners = document.querySelectorAll('.partner');
  console.log(partners)
    partners.forEach((partner) => {
      partner.addEventListener('click', (event) => {
        console.log(event);
        partner.classList.add('bordered')
        form.classList.toggle('d-none');
      })
    })
}


export { showInput };