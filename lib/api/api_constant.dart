class ApiConstants {
  static String profileUrl = 'https://graph.microsoft.com/v1.0/me';
  static String usersEndpoint = '';

  static String listApp =
      'https://graph.microsoft.com/beta/sites/cac9824d-3f08-49f1-b05f-4b522b0e3d3f/lists/c5fc01ba-02c0-43d5-8e13-75030cd8f1f1/items?expand=fields&orderby=fields/Order0';
  static String urlIconGet =
      "https://graph.microsoft.com/v1.0/drives/b!TYLJygg_8UmwX0tSKw49PyS7V7D0FkpIoy3Zl71h0IV_vCA3-ftkRrWKi0Qw7xz1/root:/Lists/c5fc01ba-02c0-43d5-8e13-75030cd8f1f1/"; // ada 1 path lagi di belakang yaitu nama img, akan dipanggil nanti di grid app
  static String urlAnnouncement =
      "https://graph.microsoft.com/beta/sites/cac9824d-3f08-49f1-b05f-4b522b0e3d3f/lists/31dcfee1-14a6-48b1-95d2-e43f1bca5da6/items?expand=fields&filter=fields/Visibility+eq+1&orderBy=fields/Order0";

  static String goldsilverprice =
      "https://new-sada-apps.infimedia.co.id/api/goldsilverprice";
  static String exchangerate =
      "https://new-sada-apps.infimedia.co.id/api/exchangerates";

  static String appUrl = "https://sada-apps.infimedia.co.id/api/apps";
  static String appbanner = "https://sada-apps.infimedia.co.id/api/lti?sort_by=id&arrangement=desc";
  static String appsafety = "https://new-sada-apps.infimedia.co.id/api/safety";
  static String appUrlCategories =
      "http://sada-apps.infimedia.co.id/api/categories?sort_by=sort_order&arrangement=asc&sort_app_by=sort_order&arrangement_app_by=asc";

  static String apiKeynew = "xW4vfv6g0Ey2D730Joob9j9NoND6Wu0vah6iliHHEQt7RU5pyA197Xxiq2E3SCBC";
  static String apiKey =
      "EsqqWo6hgHRZhkDvYwKLrhAcDwZ3IYvzqwt5A1zWbZNqNdY8LPBPVBVjYPU4Af2d";
}
