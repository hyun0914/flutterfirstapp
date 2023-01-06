import 'package:flutter/material.dart';
import '../../layout/simple_bar_layout.dart';

class PointInformationPage extends StatelessWidget {
  const  PointInformationPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleBarLayout(
      title: '포인트 안내',
      topIcon: null,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 9),
          child: Column(
            children: [
              pointText('포인트는 회원만 적립/사용이 가능합니다.(비회원은 포인트 전릭/사용 불가)'),
              pointText('VIP회원은 실결제 금액의 3%를 적립해 드립니다.('
                  '구매 확정 7일 후 적립, 실결제 금액 = 상품 금액 + 초록도시에서 결제한 배송비 - 상품 할인 금액 - 쿠폰 할인 금액 - 포인트 사용 금액'),
              pointText('포인트는 3만원 이상 결제 시 사용 가능합니다. (배송비 제외)'),
              pointText('단 포인트에 따라 최소 결제 금액 및 최대 사용 금액 제한이 있을 수 있으며, 일부 상품의 경우 포인트 사용이 제한 될수 있습니다.'),
              pointText('교환, 취소, 환불 시 수수료는 포인트로 결제가 불가능 합니다.'),
              pointText('결제 후 취소 시, 포인트 사용 기간이 남아있는 경우 자동복원됩니다.'),
              pointText('일부 상품만 취소 시 , 잔여 결제 금액이 3만원 미만인 경우 포인트가 먼저 환불됩니다.'),
              pointText('포인트의 유효기간이 만료되면 자동으로 소멸됩니다.'),
              pointText('회원을 탈퇴할 경우, 잔여 포인트는 모두 소멸됩니다.'),
              pointText('포인트 정책은 운영 정책에 따라 변경될 수 있습니다.'),
            ],
          ),
        )
      ],
    );
  }
}

Widget pointText(String textP){
  return Row(
    children: [
      Flexible(child: Text('● ' +textP)),
    ],
  );
}
