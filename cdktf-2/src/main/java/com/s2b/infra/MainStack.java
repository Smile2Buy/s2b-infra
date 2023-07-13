package com.s2b.infra;

import com.hashicorp.cdktf.TerraformOutput;
import com.hashicorp.cdktf.TerraformStack;
import com.hashicorp.cdktf.providers.aws.instance.Instance;
import com.hashicorp.cdktf.providers.aws.provider.AwsProvider;
import software.constructs.Construct;

public class MainStack extends TerraformStack {
    public MainStack(final Construct scope, final String id) {
        super(scope, id);

        // define resources here
        AwsProvider.Builder.create(this, "AWS")
                .region("ap-northeast-2")
                .build();

        Instance instance = Instance.Builder.create(this, "compute")
                .ami("ami-00e172885f09be17c")
                .instanceType("t3.micro")
                .build();

        TerraformOutput.Builder.create(this, "public_ip")
                .value(instance.getPublicIp())
                .build();
    }
}
