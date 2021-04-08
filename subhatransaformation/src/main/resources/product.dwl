%dw 2.0
output application/xml
import getconvertedprice as gcp from myModule::myCustomModule
---
productinfo:
{
  pid:payload.productId,
  pname:payload.productName,
  poriginalprice:payload.originalPrice,
  pbrnd:payload.brand,
  offer:using(price=90)
  {
	offerprice:payload.offer.offerprice*price,
	offervalidtill:payload.offer.offerValid,
	//discount:payload.originalPrice-gcp(offerprice)
 discount:payload.originalPrice-(gcp(payload.offer.offerprice))
  
  }
}


