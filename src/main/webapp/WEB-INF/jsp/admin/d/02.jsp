<%@ page import="grinbi.message.MessageSourceWrapper" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: BangEunLee
  Date: 2021-06-01
  Time: 오후 2:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container" id="divContainer">
    <div class="cnt_tit">
        <h2 class="nav_3_1">KOR - 약국 등록</h2>
    </div>
    <div class="contents" id="D_02">
        <form action='<c:url value="/admin/parmacy/add.do" />' method="post" modeltype="daygen.model.physical.ParmacyModel">
            <div class="gnb01">
                <table class="tbl_1">
                    <caption>정보입력</caption>
                    <colgroup>
                        <col style="width: 20%">
                        <col style="width: 80%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row"><em>*</em>주소1</th>
                        <td>
                            <button type="button" onclick="d_02.findAddr()" class="btn_inner">주소찾기</button>
                            <input id="member_addr" type="text" name="adres01" class="ipt_598" placeholder="주소" readonly/> <br/>
                            <input type="hidden" id="member_post" name="zip"/>
                            <input type="hidden" id="member_sido" name="ctprvn"/>
                            <input type="hidden" id="member_sigungu" name="signgu"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><em>*</em>주소2</th>
                        <td>
                            <input type="text" placeholder="상세주소" name="adres02" class="ipt_long"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><em>*</em>약국명</th>
                        <td>
                            <input type="text" name="parmacyNm" class="ipt_long" placeholder="약국명을 입력합니다."/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><em>*</em>전화번호</th>
                        <td>
                            <input type="text" name="telno" class="ipt_long" placeholder="전화번호를 입력합니다."/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><em>*</em>노출여부</th>
                        <td>
                            <input type="radio" name="expsrYn" value="Y" checked="checked"/>
                            <label>Yes</label>
                            <input type="radio" name="expsrYn" class="ml20" value="N"/>
                            <label>No</label>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn_area">
                    <button name="btn_delete" class="btn_left">삭제</button>
                    <button name="btn_list">목록</button>
                    <button type="submit" name="btn_submit">확인</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=<%= MessageSourceWrapper.getStaticMessage("kakaoAPIKey") %>&libraries=services,clusterer,drawing"></script>

<script type="text/javascript">
    let d_02 = (function () {
        let $container = $('#D_02');

        function setUI(isModify) {
            if (isModify) {
                $container.find('form').attr('action', '<c:url value="/admin/parmacy/modify.do" />');
                $container.find('[name=btn_delete]').show();
            } else {
                $container.find('form').attr('action', '<c:url value="/admin/parmacy/add.do" />');
                $container.find('[name=btn_delete]').hide();
            }
        }

        function findAddr() {
            new daum.Postcode({
                oncomplete: function (data) {

                    console.log(data);

                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    let roadAddr = data.roadAddress; // 도로명 주소 변수
                    let jibunAddr = data.jibunAddress; // 지번 주소 변수
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    // document.getElementById('member_post').value = data.zonecode;
                    if (roadAddr !== '') {
                        document.getElementById("member_addr").value = roadAddr;
                    } else if (jibunAddr !== '') {
                        document.getElementById("member_addr").value = jibunAddr;
                    }

                    document.getElementById('member_post').value = data.zonecode; // 우편번호
                    document.getElementById('member_sido').value = data.sido; // 시도
                    document.getElementById('member_sigungu').value = data.sigungu; // 시군구
                }
            }).open();
        }

        let kakaoMap = function (address) {
            let geocoder = new kakao.maps.services.Geocoder();

            let callback = function (result, status) {
                if (status === kakao.maps.services.Status.OK) {

                    let fordata = $container.find('form').data('formdata');
                    $container.find('form').data('formdata', $.extend(fordata, {
                            la: result[0].address.y,
                            lo: result[0].address.x
                        })
                    );

                    $container.find('form').submit();
                } else if (status === 'ZERO_RESULT') {
                    BIT.modal('주소 검색 결과가 없습니다.');
                } else {
                    BIT.modal(status);
                }
            }
            geocoder.addressSearch(address, callback);
        };

        let init = function () {
            if ($.getUrlVar('parmacyPid') != null) {
                setUI(true);
                if (isNaN($.getUrlVar('parmacyPid'))) {
                    BIT.modal('유효하지 않은 요청입니다', '알림', function () {
                        $container.find('[name=btnList]').trigger('click');
                    });
                    return;
                }
                BIT.callAjax('<c:url value="/admin/parmacy/getParmacy.do" />', 'post', {
                    parmacyPid: $.getUrlVar('parmacyPid')
                }, function (response) {
                    if (response.IsSucceed) {
                        $container.find('form').data('formdata', {
                            parmacyPid: response.Data.parmacyPid
                        });
                        BIT.bindObjectData(response.Data, {$parent: $container});
                    }
                });
            } else {
                setUI(false);
            }

            BIT.validate($container.find('form'), 'formdata', function (response) {
                if (response.IsSucceed) {
                    BIT.modal('약국정보를 저장 하였습니다.', '알림', function () {
                        if ($.getUrlVar('parmacyPid') != null) {
                            location.href = '<c:url value="/admin/index.do?pageid=d_01&"/>' + window.location.href.slice(window.location.href.indexOf('&') + 1);
                        } else {
                            location.href = '<c:url value="/admin/index.do?pageid=d_01"/>';
                        }
                    });
                }
            });
        };

        let registerEventHandler = function () {
            $container.find('[name=btn_submit]').click(function (e) {
                e.preventDefault();
                kakaoMap($container.find('[name=adres01]').val() + " " + $container.find('[name=adres02]').val());
                return false;
            });

            $container.find('[name=btn_delete]').click(function (e) {
                e.preventDefault();

                BIT.confirmUI('약국 정보를 삭제하겠습니까?', '확인', function () {
                    BIT.callAjax('<c:url value="/admin/parmacy/remove.do" />', 'post', {parmacyPid: $.getUrlVar('parmacyPid')}, function (response) {
                        if (response.IsSucceed) {
                            if ($.getUrlVar('parmacyPid') != null) {
                                location.href = '<c:url value="/admin/index.do?pageid=d_01&"/>' + window.location.href.slice(window.location.href.indexOf('&') + 1);
                            } else {
                                location.href = '<c:url value="/admin/index.do?pageid=d_01"/>';
                            }
                        }
                    });
                });
            });

            $container.find('[name=btn_list]').click(function (e) {
                e.preventDefault();

                if ($.getUrlVar('parmacyPid') != null) {
                    location.href = '<c:url value="/admin/index.do?pageid=d_01&"/>' + window.location.href.slice(window.location.href.indexOf('&') + 1);
                } else {
                    location.href = '<c:url value="/admin/index.do?pageid=d_01"/>';
                }
            });
        };

        return {
            init: function () {
                init();
                registerEventHandler();
            }, findAddr: function () {
                findAddr();
            }
        };
    })();

    d_02.init();

</script>