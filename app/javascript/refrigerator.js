if (location.pathname.match("refrigerators")){
function refrigerator() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const formData = new FormData(document.getElementById("new_food"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/refrigerators", true);
    XHR.responseType = "json";
    XHR.send(formData);
    console.log(XHR)
    XHR.onload = () => {
      if (XHR.status != 200){
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.refrigerator;
      const foodComment = document.getElementById("foodlists");
      const foodstuffText = document.getElementById("foodstuff_text");
      const HTML = `
      <li class="refrigerators_list" style="color:red;">
      ${ item.foodstuff }
      <a class="form_refrigerator_btn" rel="nofollow" data-method="delete" href="/refrigerators/${item.id}">x</a>
      </li>`;
      foodComment.insertAdjacentHTML("afterbegin", HTML);
      foodstuffText.value = "";
    };

    e.preventDefault();
  })
}
window.addEventListener("load", refrigerator);
}