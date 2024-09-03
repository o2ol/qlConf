#!/usr/bin/env bash
echo "task_before.sh 拦截当前运行脚本： $1"
scritps_js=(
    "关键字”
)
# 判断js是否包含在limit_js中
for js_file in "${scritps_js[@]}"; do
    # 如果prefix包含name_js中的某个元素，则打印出提示
    if [[ $1 == *"$js_file"* ]]; then

        echo "*******脚本：$1*******"
        envs=${!js_file}
        # echo $envs
        converted_envs=$(echo $envs | sed 's/&@&/ /g')
        echo "* 获取变量：成功✅"
        # echo $converted_envs
        IFS=' ' read -r -a envs_array <<< "$converted_envs"
        # 打印数组长度
        echo "* 转换数量: ${#envs_array[@]}"
        echo "* 转换变量：成功✅"
        [[ ! -z $converted_envs ]] && export $js_file="$converted_envs"
        echo "*******脚本：$1*******"
    fi
done
