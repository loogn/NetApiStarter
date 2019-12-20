
function selectArea($province, $city, $county) {
    this.province = $province;
    this.city = $city;
    this.county = $county;
}


selectArea.prototype.init = function () {

    function getOption(value, name) {
        return '<option value="' + value + '">' + name + '</option>';
    }
    function render() {
        
    }
    
    
    var $this = this;
    var isFirst = {
        province: true, city: true, county: true
    };
    $this.province.change(function () {
        var provinceId = $this.province.val();
        if (provinceId > 0) {
            $.get('/region/getcity', { provinceCode: provinceId }, function (list) {
                var html = getOption("0", "-- 市 --");
                for (var i = 0; i < list.length; i++) {
                    var item = list[i];
                    html += getOption(item.code, item.name);
                }
                $this.city.html(html);
                render();
                if ($this.city.data('value') > 0 && isFirst.city) {
                    isFirst.city = false;
                    $this.city.val($this.city.data('value'));
                }
                $this.city.change();
            });
        } else {
            var html = getOption("0", "-- 市 --");
            $this.city.html(html).change();
            render();
        }
    });

    $this.city.change(function () {
        var cityId = $this.city.val();
        if (cityId > 0) {
            $.get('/region/getcounty', { cityCode: cityId }, function (list) {
                var html = getOption("0", "-- 县/区 --");
                for (var i = 0; i < list.length; i++) {
                    var item = list[i];
                    html += getOption(item.code, item.name);
                }
                $this.county.html(html);
                render();
                if ($this.county.data('value') && $this.county.data('value') > 0 && isFirst.county) {
                    isFirst.county = false;
                    $this.county.val($this.county.data('value'));
                }
            });
        } else {
            var html = getOption("0", "-- 县/区 --");
            $this.county.html(html);
            render();
        }
    });
    $this.county.change(function () {
        $this.county.data('value', 0);
    });

    $.get("/region/getprovince", function (list) {
        var html = getOption("0", "-- 省 --");
        for (var i = 0; i < list.length; i++) {
            var item = list[i];
            html += getOption(item.code, item.name);
        }
        $this.province.html(html);
        render();
        if ($this.province.data('value') && $this.province.data('value') > 0 && isFirst.province) {
            isFirst.province = false;
            $this.province.val($this.province.data('value')).change();
        }

    });

}
