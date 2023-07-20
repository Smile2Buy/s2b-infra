package com.s2b.infra;

import com.hashicorp.cdktf.TerraformStack;
import software.constructs.Construct;

public class MainStack extends TerraformStack {
    public MainStack(final Construct scope, final String id) {
        super(scope, id);

//        // define resources here
//        RandomProvider.Builder.create(this, "random")
//                .build();
//        Pet pet = Pet.Builder.create(this, "pet")
//                .build();
//        TerraformOutput.Builder.create(this, "pet_id")
//                .value(pet.getId())
//                .build();

//        AwsProvider.Builder.create(this, "AWS")
//                .region("ap-northeast-2")
//                .build();
//
//        Vpc vpc = Vpc.Builder.create(this, "main")
//                .cidrBlock("10.0.0.0/16")
//                .enableDnsSupport(true)
//                .enableDnsHostnames(true)
//                .tags(Map.of("Name", "main"))
//                .build();
//
//        Instance instance = Instance.Builder.create(this, "compute")
//                .ami("ami-00e172885f09be17c")
//                .instanceType("t3.micro")
//                .build();
//
//        TerraformOutput.Builder.create(this, "public_ip")
//                .value(instance.getPublicIp())
//                .build();
    }
}
