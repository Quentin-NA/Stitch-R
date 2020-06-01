const selectRow = () => {
	// const rows = document.querySelectorAll("tr");
	const dismissButtons = document.querySelectorAll(".btn-minus");

	dismissButtons.forEach((minus_button) => {
    minus_button.addEventListener("click", (event) => {
      console.log(event);
			if (event.path[3].style.opacity === "0.3") {
				event.path[3].style.opacity = "1";
				minus_button.classList.add(("fa-minus-square"));
				minus_button.classList.remove(("fa-plus-square"));
			} else {
				event.path[3].style.opacity = "0.3";
				minus_button.classList.add(("fa-plus-square"));
				minus_button.classList.remove(("fa-minus-square"));
			};
		});
  });
};

// const changeStatus = () => {
//   if (event.path[3].style.opacity === "0.3") {
//     Receipt.status = "Not sent"
//   } else {
//     Receipt.status = "Sent"
//   };
// };

// export { changeStatus };
export { selectRow };

