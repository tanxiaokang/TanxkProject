#author by 得力

#注意：脚本目录和WorkSpace目录在同一个目录
#工程名字(Target名字)
Project_Name="尝试封装Network"
#workspace的名字
Workspace_Name="尝试封装Network"
#配置环境，Release或者Debug,默认release
Configuration="Debug"

#AdHoc版本的Bundle ID
AdHocBundleID="com.wangzhixing.network"
#AppStore版本的Bundle ID
AppStoreBundleID="com.wangzhixing.network"
#enterprise的Bundle ID
EnterpriseBundleID="com.wangzhixing.network"

# ADHOC证书名#描述文件
ADHOCCODE_SIGN_IDENTITY="iPhone Developer: wang jianchun (3LD52TQJBF)"
ADHOCPROVISIONING_PROFILE_NAME="33ed91c4-1cf3-459a-a1e7-1e0ff5836652"

#AppStore证书名#描述文件
APPSTORECODE_SIGN_IDENTITY="Phone Distribution: Wuhai Jurongyi Technology Co., Ltd. (LM4E4529GY)"
APPSTOREROVISIONING_PROFILE_NAME="a0ceb96b-74b1-44dc-87ac-d0d170113f0d"

#企业(enterprise)证书名#描述文件
ENTERPRISECODE_SIGN_IDENTITY="Phone Distribution: Wuhai Jurongyi Technology Co., Ltd. (LM4E4529GY)"
ENTERPRISEROVISIONING_PROFILE_NAME="a0ceb96b-74b1-44dc-87ac-d0d170113f0d"

#加载各个版本的plist文件
ADHOCExportOptionsPlist=./ADHOCExportOptionsPlist.plist
AppStoreExportOptionsPlist=./AppStoreExportOptionsPlist.plist
EnterpriseExportOptionsPlist=./EnterpriseExportOptionsPlist.plist

ADHOCExportOptionsPlist=${ADHOCExportOptionsPlist}
AppStoreExportOptionsPlist=${AppStoreExportOptionsPlist}
EnterpriseExportOptionsPlist=${EnterpriseExportOptionsPlist}

echo "~~~~~~~~~~~~选择打包方式(输入序号)~~~~~~~~~~~~~~~"
echo "  1 adHoc"
echo "  2 AppStore"
echo "  3 Enterprise"

# 读取用户输入并存到变量里
read parameter
sleep 0.5
method="$parameter"

# 判读用户是否有输入
if [ -n "$method" ]
then
    if [ "$method" = "1" ]
    then
#adhoc脚本
xcodebuild -workspace $Workspace_Name.xcworkspace -scheme $Project_Name -configuration $Configuration -archivePath build/$Project_Name-adhoc.xcarchive clean archive build CODE_SIGN_IDENTITY="${ADHOCCODE_SIGN_IDENTITY}" PROVISIONING_PROFILE="${ADHOCPROVISIONING_PROFILE_NAME}" PRODUCT_BUNDLE_IDENTIFIER="${AdHocBundleID}"
xcodebuild  -exportArchive -archivePath build/$Project_Name-adhoc.xcarchive -exportOptionsPlist ${ADHOCExportOptionsPlist} -exportPath ~/Desktop/$Project_Name-adhoc.ipa

    elif [ "$method" = "2" ]
    then
#appstore脚本
xcodebuild -workspace $Workspace_Name.xcworkspace -scheme $Project_Name -configuration $Configuration -archivePath build/$Project_Name-appstore.xcarchive archive build CODE_SIGN_IDENTITY="${APPSTORECODE_SIGN_IDENTITY}" PROVISIONING_PROFILE="${APPSTOREROVISIONING_PROFILE_NAME}" PRODUCT_BUNDLE_IDENTIFIER="${AppStoreBundleID}"
xcodebuild  -exportArchive -archivePath build/$Project_Name-appstore.xcarchive -exportOptionsPlist ${AppStoreExportOptionsPlist} -exportPath ~/Desktop/$Project_Name-appstore.ipa

    elif [ "$method" = "3" ]
    then
#企业打包脚本
xcodebuild -workspace $Workspace_Name.xcworkspace -scheme $Project_Name -configuration $Configuration -archivePath build/$Project_Name-enterprise.xcarchive archive build CODE_SIGN_IDENTITY="${ENTERPRISECODE_SIGN_IDENTITY}" PROVISIONING_PROFILE="${ENTERPRISEROVISIONING_PROFILE_NAME}" PRODUCT_BUNDLE_IDENTIFIER="${EnterpriseBundleID}"
xcodebuild  -exportArchive -archivePath build/$Project_Name-enterprise.xcarchive -exportOptionsPlist ${EnterpriseExportOptionsPlist} -exportPath ~/Desktop/$Project_Name-enterprise.ipa
    else
    echo "参数无效...."
    exit 1
    fi
fi