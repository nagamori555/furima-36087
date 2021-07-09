function post (){
  const profitCalc = document.getElementById("item-price");
  profitCalc.addEventListener("input", () => {
    const price = profitCalc.value;
    const commission_rate = 0.1 ;
    const commission_fee = price * commission_rate;
    const profit = price - commission_fee;

    const commission_area = document.getElementById("add-tax-price");
    const profit_area = document.getElementById("profit");

    commission_area.innerHTML = `${Math.floor(commission_fee)}`;
    profit_area.innerHTML = `${Math.floor(profit)}`;

  });
 };
 
 window.addEventListener('load', post);