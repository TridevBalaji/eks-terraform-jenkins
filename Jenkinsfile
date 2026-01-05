pipeline {
  agent any

  parameters {
    choice(
      name: 'ACTION',
      choices: ['plan', 'apply', 'destroy'],
      description: 'Terraform action to perform'
    )
  }

  options {
    disableConcurrentBuilds()
  }

  stages {

    stage('Checkout Code') {
      steps {
        git branch: 'main',
            url: 'https://github.com/TridevBalaji/eks-terraform-jenkins.git'
      }
    }

    stage('Terraform Init') {
      steps {
        sh '''
        rm -rf .terraform .terraform.lock.hcl
        terraform init -upgrade
        '''
      }
    }

    stage('Terraform Validate') {
      steps {
        sh 'terraform validate'
      }
    }

    stage('Terraform Plan') {
      when {
        expression { params.ACTION == 'plan' || params.ACTION == 'apply' }
      }
      steps {
        sh 'terraform plan'
      }
    }

    stage('Terraform Apply') {
      when {
        expression { params.ACTION == 'apply' }
      }
      steps {
        sh 'terraform apply -auto-approve'
      }
    }

    stage('Terraform Destroy') {
      when {
        expression { params.ACTION == 'destroy' }
      }
      steps {
        sh 'terraform destroy -auto-approve'
      }
    }
  }
}
