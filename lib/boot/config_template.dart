class Config {
  /// 服务提供方
  final String sponsor;

  /// 电子邮件
  final String email;

  // GitHub 仓库
  final String githubAddr;

  const Config({
    this.sponsor = '未署名',
    this.email = 'undefined@example.com',
    this.githubAddr = 'https://github.com/LYExamination/LYExamination',
  });
}
