# 编译前修改下列参数

flutter build apk `
--obfuscate `
--split-debug-info `
--split-per-abi `
--target-platform=android-arm64 `
--build-number=0 `
--build-name=v `
--dart-define=maintainer='' `
--dart-define=email=@ `
--dart-define=github=https://github.com/qianjunakasumi/LYExamination `
--dart-define=maintainerGitHubProfile=https://github.com/qianjunakasumi