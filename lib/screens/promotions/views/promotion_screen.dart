import 'package:flutter/material.dart';
import 'package:rx_customer/res/app_styles.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({super.key});

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class PromotionData {
  String promoOwner;
  String promoType;
  String promoName;
  String promoPeriod;
  String image;
  PromotionData({
    required this.promoOwner,
    required this.promoType,
    required this.promoName,
    required this.promoPeriod,
    required this.image,
  });
}

final List<PromotionData> _data = [
  PromotionData(
    promoOwner: "Public",
    promoType: "Promo Special",
    promoName: "September Ceria",
    promoPeriod: "1 Aug - 31 Oct 2024",
    image: "assets/images/promo1.png",
  ),
  PromotionData(
    promoOwner: "Public",
    promoType: "Promo Special",
    promoName: "Pay 1 for 2",
    promoPeriod: "1 - 31 Sep 2024",
    image: "assets/images/promo1.png",
  ),
  PromotionData(
    promoOwner: "Private",
    promoType: "Promo Special",
    promoName: "Exclusive Deal",
    promoPeriod: "1 - 31 Sep 2024",
    image: "assets/images/promo2.png",
  ),
];

final List<String> _dataCategory = [
  "Promo",
  "Promo Saya",
];

class _PromotionScreenState extends State<PromotionScreen> {
  int selectedCategoryIndex = 0;

  void _selectCategory(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  List<PromotionData> _getFilteredPromotions() {
    if (selectedCategoryIndex == 0) {
      // Show only "Public" promotions
      return _data.where((promo) => promo.promoOwner == "Public").toList();
    } else {
      // Show only "Private" promotions
      return _data.where((promo) => promo.promoOwner == "Private").toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredPromotions = _getFilteredPromotions();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F7),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              snap: true,
              backgroundColor: Colors.white,
              title: Text(
                "Promo",
                style: TextStyle(
                  color: AppStyles.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_dataCategory.length, (index) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: TextButton(
                          onPressed: () => _selectCategory(index),
                          style: TextButton.styleFrom(
                            side: BorderSide(
                              color: AppStyles.primaryColor,
                              width: 1,
                            ),
                            backgroundColor: selectedCategoryIndex == index
                                ? AppStyles.primaryColor
                                : Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            _dataCategory[index],
                            style: TextStyle(
                              color: selectedCategoryIndex == index
                                  ? Colors.white
                                  : AppStyles.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    width: double.infinity,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  filteredPromotions[index].promoType,
                                  style: AppStyles.cardPromoType,
                                ),
                                Text(
                                  filteredPromotions[index].promoName,
                                  style: AppStyles.cardPromoTitle,
                                ),
                                Text(
                                  filteredPromotions[index].promoPeriod,
                                  style: AppStyles.cardPromoPeriod,
                                ),
                                Text(
                                  "Syarat & Ketentuan",
                                  style: AppStyles.cardPromoTnc,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 160,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage(filteredPromotions[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: filteredPromotions.length,
              ),
            ),
            if (filteredPromotions.isEmpty)
              const SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("Promo belum tersedia"),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
