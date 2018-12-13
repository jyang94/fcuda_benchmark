<AutoPilot:project xmlns:AutoPilot="com.autoesl.autopilot.project" projectType="C/C++" name="matmul" top="matrixMul">
    <Simulation argv="">
        <SimFlow name="csim" setup="false" optimizeCompile="false" clean="false" ldflags="" mflags=""/>
    </Simulation>
    <includePaths/>
    <libraryFlag/>
    <files>
        <file name="../../matrixMul.cpp" sc="0" tb="1" cflags=" -I/home/xu67/thesis_fcuda/fcuda/fcuda_src/include "/>
        <file name="fcuda_gen/fcuda_gen_matmul.cpp" sc="0" tb="false" cflags="-I/home/xu67/thesis_fcuda/fcuda/fcuda_src/include"/>
    </files>
    <solutions>
        <solution name="solution1" status=""/>
    </solutions>
</AutoPilot:project>

