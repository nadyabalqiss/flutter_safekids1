import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'role_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState
    extends State<OnboardingScreen> {

  final PageController _controller =
      PageController();

  int currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      "image":
          "assets/images/onboarding1.png",
      "title":
          "Selamat Datang di SafeKids",
      "desc":
          "Platform keamanan penjemputan anak dan komunikasi sekolah."
    },
    {
      "image":
          "assets/images/onboarding2.png",
      "title":
          "Penjemputan Lebih Aman",
      "desc":
          "QR Code memastikan anak dijemput oleh pihak yang benar."
    },
    {
      "image":
          "assets/images/onboarding3.png",
      "title":
          "Fitur Unggulan",
      "desc":
          "Notifikasi real-time dan monitoring penjemputan."
    },
    {
      "image":
          "assets/images/onboarding4.png",
      "title":
          "Siap Menggunakan SafeKids?",
      "desc":
          "Pilih peran Anda dan mulai pengalaman sekolah yang aman."
    },
  ];

  @override
  Widget build(BuildContext context) {

    final size =
        MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffEAF4FF),
              Colors.white,
            ],
          ),
        ),

        child: SafeArea(
          child: Column(
            children: [

              // SKIP
              Padding(
                padding:
                    const EdgeInsets
                        .only(
                  top: 10,
                  right: 20,
                ),
                child: Align(
                  alignment:
                      Alignment
                          .topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator
                          .pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const RoleScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Skip",
                      style:
                          TextStyle(
                        color:
                            AppColors
                                .primary,
                        fontSize:
                            16,
                        fontWeight:
                            FontWeight
                                .w600,
                      ),
                    ),
                  ),
                ),
              ),

              // PAGEVIEW
              Expanded(
                child:
                    PageView.builder(
                  controller:
                      _controller,
                  itemCount:
                      pages.length,
                  onPageChanged:
                      (index) {
                    setState(() {
                      currentIndex =
                          index;
                    });
                  },
                  itemBuilder:
                      (context,
                          index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(
                        horizontal:
                            size.width *
                                0.08,
                      ),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                        children: [

                          // CARD IMAGE
                          Container(
                            padding:
                                const EdgeInsets
                                    .all(
                                    20),
                            decoration:
                                BoxDecoration(
                              color: Colors
                                  .white,
                              borderRadius:
                                  BorderRadius.circular(
                                      30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors
                                      .black12,
                                  blurRadius:
                                      18,
                                  offset:
                                      const Offset(
                                          0,
                                          8),
                                ),
                              ],
                            ),
                            child:
                                Image.asset(
                              pages[index]
                                  ['image']!,
                              height:
                                  size.height *
                                      0.28,
                              fit: BoxFit
                                  .contain,
                            ),
                          ),

                          const SizedBox(
                              height: 40),

                          // TITLE
                          Text(
                            pages[index]
                                ['title']!,
                            textAlign:
                                TextAlign
                                    .center,
                            style:
                                const TextStyle(
                              fontSize:
                                  30,
                              fontWeight:
                                  FontWeight
                                      .bold,
                              color: Color(
                                  0xff1F2937),
                            ),
                          ),

                          const SizedBox(
                              height: 18),

                          // DESC
                          Padding(
                            padding:
                                const EdgeInsets
                                    .symmetric(
                                    horizontal:
                                        8),
                            child: Text(
                              pages[index]
                                  ['desc']!,
                              textAlign:
                                  TextAlign
                                      .center,
                              style:
                                  TextStyle(
                                fontSize:
                                    15,
                                color: Colors
                                        .grey[
                                    600],
                                height:
                                    1.7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // DOTS
              Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                children:
                    List.generate(
                  pages.length,
                  (index) =>
                      AnimatedContainer(
                    duration:
                        const Duration(
                            milliseconds:
                                350),
                    margin:
                        const EdgeInsets
                            .symmetric(
                            horizontal:
                                5),
                    height: 10,
                    width:
                        currentIndex ==
                                index
                            ? 28
                            : 10,
                    decoration:
                        BoxDecoration(
                      color:
                          currentIndex ==
                                  index
                              ? AppColors
                                  .primary
                              : Colors
                                  .grey
                                  .shade300,
                      borderRadius:
                          BorderRadius
                              .circular(
                                  20),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                  height: 35),

              // BUTTON
              Padding(
                padding:
                    const EdgeInsets
                        .symmetric(
                        horizontal:
                            24),
                child: SizedBox(
                  width: double.infinity,
                  height: 58,
                  child:
                      ElevatedButton(
                    style:
                        ElevatedButton
                            .styleFrom(
                      backgroundColor:
                          AppColors
                              .primary,
                      elevation: 2,
                      shadowColor:
                          Colors
                              .black26,
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                                18),
                      ),
                    ),
                    onPressed:
                        () {

                      if (currentIndex ==
                          pages.length -
                              1) {

                        Navigator
                            .pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const RoleScreen(),
                          ),
                        );

                      } else {

                        _controller
                            .nextPage(
                          duration:
                              const Duration(
                                  milliseconds:
                                      500),
                          curve: Curves
                              .easeInOut,
                        );
                      }
                    },
                    child: Text(
                      currentIndex ==
                              pages.length -
                                  1
                          ? "Mulai"
                          : "Next",
                      style:
                          const TextStyle(
                        color:
                            Colors.white,
                        fontSize: 18,
                        fontWeight:
                            FontWeight
                                .w600,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                  height: 35),
            ],
          ),
        ),
      ),
    );
  }
}