package com.s2b.infra;

import com.hashicorp.cdktf.App;
import com.hashicorp.cdktf.NamedRemoteWorkspace;
import com.hashicorp.cdktf.RemoteBackend;
import com.hashicorp.cdktf.RemoteBackendConfig;
import com.hashicorp.cdktf.TerraformStack;

public class Main {
    public static void main(String[] args) {
        final App app = new App();
        TerraformStack stack = new MainStack(app, "cdktf");
        new RemoteBackend(stack, RemoteBackendConfig.builder()
                .hostname("app.terraform.io")
                .organization("smile2buy")
                .workspaces(new NamedRemoteWorkspace("cdktf"))
                .build());
        app.synth();
    }
}