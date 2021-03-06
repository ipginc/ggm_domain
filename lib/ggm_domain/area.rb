module GgmDomain
  module Area
    MINDS_AREA_TO_GGM_GROUP_ID = {
        10 => 1, #	札幌
        11 => 8, #	函館
        12 => 3, #	旭川
        13 => 9, #	帯広
        14 => 10, #	釧路
        15 => 12, #	北見
        16 => 6, #	室蘭
        22 => 13, #	青森
        20 => 16, #	岩手
        17 => 19, #	宮城
        18 => 22, #	秋田
        19 => 25, #	山形
        21 => 28, #	福島
        23 => 42, #	東京
        24 => 45, #	神奈川
        29 => 37, #	埼玉
        27 => 40, #	千葉
        26 => 31, #	茨城
        28 => 33, #	栃木
        25 => 35, #	群馬
        32 => 50, #	山梨
        30 => 51, #	長野
        31 => 56, #	新潟
        33 => 73, #	愛知
        34 => 60, #	石川
        35 => 67, #	静岡
        36 => 62, #	福井
        37 => 58, #	富山
        38 => 76, #	三重
        39 => 64, #	岐阜
        40 => 84, #	大阪
        41 => 81, #	京都
        42 => 85, #	兵庫
        43 => 93, #	和歌山
        44 => 91, #	奈良
        45 => 79, #	滋賀
        46 => 101, #	広島
        47 => 98, #	岡山
        48 => 96, #	島根
        49 => 95, #	鳥取
        50 => 105, #	山口
        51 => 112, #	愛媛
        52 => 110, #	香川
        53 => 109, #	徳島
        54 => 116, #	高知
        55 => 117, #	福岡
        56 => 126, #	熊本
        57 => 123, #	長崎
        58 => 131, #	鹿児島
        59 => 129, #	宮崎
        60 => 127, #	大分
        61 => 122, #	佐賀
        62 => 134, #	沖縄
        63 => 120 #	北九州
    }.each_value(&:freeze).freeze

    CAPITAL_GGM_GROUP_ID = 42.freeze

    GGM_GROUP_ID = {
        1 => '札幌',
        8 => '函館',
        3 => '旭川',
        9 => '帯広',
        10 => '釧路',
        12 => '北見',
        6 => '室蘭',
        13 => '青森',
        16 => '岩手',
        19 => '宮城',
        22 => '秋田',
        25 => '山形',
        28 => '福島',
        42 => '東京',
        45 => '神奈川',
        37 => '埼玉',
        40 => '千葉',
        31 => '茨城',
        33 => '栃木',
        35 => '群馬',
        50 => '山梨',
        51 => '長野',
        56 => '新潟',
        73 => '愛知',
        60 => '石川',
        67 => '静岡',
        62 => '福井',
        58 => '富山',
        76 => '三重',
        64 => '岐阜',
        84 => '大阪',
        81 => '京都',
        85 => '兵庫',
        93 => '和歌山',
        91 => '奈良',
        79 => '滋賀',
        101 => '広島',
        98 => '岡山',
        96 => '島根',
        95 => '鳥取',
        105 => '山口',
        112 => '愛媛',
        110 => '香川',
        109 => '徳島',
        116 => '高知',
        117 => '福岡',
        126 => '熊本',
        123 => '長崎',
        131 => '鹿児島',
        129 => '宮崎',
        127 => '大分',
        122 => '佐賀',
        134 => '沖縄',
        120 => '北九州'
    }.each_value(&:freeze).freeze

    CS_GENRE = {
        200 => '映画',
        201 => 'スポーツ',
        202 => '音楽',
        203 => 'アニメ',
        204 => '総合エンターテイメント',
        205 => '海外ドラマ・バラエティ・韓流',
        206 => '国内ドラマ・バラエティ・舞台',
        207 => 'ドキュメンタリー',
        208 => 'ニュース・ビジネス経済',
        209 => '趣味・娯楽',
        210 => '教育',
        211 => 'ショッピング',
        212 => 'PPV',
        213 => '番組ガイド',
        300 => '映画',
        301 => 'スポーツ',
        302 => '音楽',
        303 => 'アニメ',
        304 => '総合エンターテイメント',
        305 => '海外ドラマ・バラエティ・韓流',
        306 => '国内ドラマ・バラエティ・舞台',
        307 => 'ドキュメンタリー',
        308 => 'ニュース・ビジネス経済',
        309 => '趣味・娯楽',
        310 => '教育',
        311 => '公営競技',
        312 => '外国語放送',
        313 => 'ショッピング',
        314 => 'PPV',
        315 => '番組ガイド',
    }.each_value(&:freeze).freeze

    TVER_AREAS =[31, 33, 35, 37, 40, 42, 45].map(&:freeze).freeze

    PPJ_AREAS =[31, 33, 35, 37, 40, 42, 45].map(&:freeze).freeze

    class << self
      def mapping_minds_to_ggm_code(area_code)
        MINDS_AREA_TO_GGM_GROUP_ID[area_code]
      end

      def mapping_ggm_to_minds_code(ggm_group_id)
        GgmDomain::Area::MINDS_AREA_TO_GGM_GROUP_ID.invert[ggm_group_id]
      end

      def in_tver_area?(ggm_group_id)
        TVER_AREAS.include? ggm_group_id
      end

      def in_ppj_area?(ggm_group_id)
        PPJ_AREAS.include? ggm_group_id
      end

    end

  end
end
