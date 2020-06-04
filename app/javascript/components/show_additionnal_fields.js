const showAdditionnalFields = () => {
  const labels = document.querySelectorAll('fieldset.receiver_name label');
  const additionnalFields = document.getElementById('additionnal-fields');
  if (labels && additionnalFields) {
    labels.forEach((label) => {
      label.addEventListener('click', (event) => {
        additionnalFields.classList.remove('d-none');
      })
    })
  }
}

export { showAdditionnalFields };
