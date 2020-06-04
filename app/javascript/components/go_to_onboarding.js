const goToOnBoarding = () => {
  const btn = document.getElementById('next-page-btn');
  if (btn) {
    console.log('hi from if in goToOnBoarding');
    setTimeout(() => {
      btn.click();
    }, 10)
  }
}

const clickOnBtn = (btn) => {
  btn.click();
}


export { goToOnBoarding };
