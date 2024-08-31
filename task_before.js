console.log("当前运行脚本：",process.env.PWD)
const repo_list = [
    {
        repo: "", // 仓库名字
        reg: "&@&",//设置的变量分隔符号
        rp: " ",//要替换的变量分隔符
        env: [ // 脚本环境变量
            "BWCJ"
        ]
    }
]

repo_list.forEach(function (repo, index) {
    if (process.env.PWD.includes(repo.repo)) {
        repo.env.forEach(function (item) {
            if (process.env.PWD.includes(item)) {
                if (process.env[item].includes(repo.reg)) {
                    process.env[item] = process.env[item].replaceAll(repo.reg, repo.rp)
                    console.log(`转换变量：成功转换${process.env[item].split(repo.rp).length}个✅✅✅` )
                }
            }
        });
    }

})
