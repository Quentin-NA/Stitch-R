const selectRow = () => {
	const rows = document.querySelectorAll("tr");
	const dismissButtons = document.querySelectorAll(".btn-minus");

	dismissButtons.forEach((minus_button) => {
		minus_button.addEventListener("click", (event) => {
			if (event.path[3].style.opacity === "0.5") {
				event.path[3].style.opacity = "1";
				minus_button.classList.add(("fa-minus-square"));
				minus_button.classList.remove(("fa-plus-square"));
			} else {
				event.path[3].style.opacity = "0.5";
				minus_button.classList.add(("fa-plus-square"));
				minus_button.classList.remove(("fa-minus-square"));
			};
		});
  });
};

export { selectRow };
