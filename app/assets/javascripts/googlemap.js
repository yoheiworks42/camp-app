
let map
let geocoder
//Map出力
function initMap(){
  geocoder = new google.maps.Geocoder() // geocodingしたあとmapを移動
    
  map = new google.maps.Map(document.getElementById('map'), {
  center: {lat: 35.6804, lng: 139.769017},
  zoom: 8
  });
}
//位置検索・特定
function EncodeAddress(){
  let inputAddress = document.getElementById('address').value; //検索欄の入力値
    geocoder.geocode({'address':inputAddress},function(results, status){ //geocodingしたらmapを移動
        if(status=='OK'){
            //地図移動
          map.setCenter(results[0].geometry.location);
          //マーカーの生成
          var marker = new google.maps.Marker({
          	position: results[0].geometry.location,
          	map: map,
          	title: results[0].formatted_address,
          	animation: google.maps.Animation.DROP
        });
        
        //住所情報の取得
        var address = results[0].formatted_address;
        var location_name = results[0].address_components[0].long_name;
        var postal_code = results[0].address_components[7].long_name;
        var pref = results[0].address_components[5].long_name;
        var sector1 = results[0].address_components[4].long_name;
        var sector2 = results[0].address_components[3].long_name;
        var number1 = results[0].address_components[2].long_name;
        var number2 = results[0].address_components[1].long_name;
        document.getElementById("info").innerHTML = address;
        document.getElementById("name").value = location_name;
        document.getElementById("postcode").value = postal_code;
        document.getElementById("address1").value = pref;
        document.getElementById("address2").value = sector1 + sector2 + number1 + number2;

        //情報ウィンドウの生成
        var infoWindow = new google.maps.InfoWindow({
          content:  results[0].formatted_address,
          pixelOffset: new google.maps.Size(0, 5)
        });

        //マーカーにリスナーを設定
        marker.addListener('click', function(){
          infoWindow.open(map, marker);
        });
        
        //情報ウィンドウリスナーを設定
        infoWindow.addListener('closeclick', function(){
          marker.setMap(null);  //マーカーを削除
        });
        
      }else if(status === '検索できませんでした') {
        alert('不明なアドレスです： ' + status);
        return;
      }else{
        alert('失敗しました： ' + status);
        return;
      }
    });
}
